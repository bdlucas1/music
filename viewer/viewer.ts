import * as $ from 'jquery'
import * as assert from 'assert'
import * as fs from 'fs'
import * as path from 'path'
import {remote} from 'electron'

//(<any>window).$ = (<any>window).jQuery = $
//require('jquery-ui-dist/jquery-ui')

const log = remote.getGlobal('console').log

window.onerror = (error, url, line) => {
    log(error, url, line)
}

// ts decls not good :(
import {PDFJSStatic, PDFDocumentProxy} from 'pdfjs-dist'
const PDFJS: PDFJSStatic = require('pdfjs-dist');
(<any>PDFJS).GlobalWorkerOptions.workerSrc = 'node_modules/pdfjs-dist/build/pdf.worker.js'

class SortedArray<T> {

    compare: (a: T, b: T) => number
    items: Array<T> = []

    constructor(compare: (a: T, b: T) => number) {
        this.compare = compare
    }

    find(e: T): number {
        let low = 0
        let high = this.items.length - 1
        while (low <= high) {
            const mid = Math.floor((low + high) / 2)
            const c = this.compare(this.items[mid], e)
            if (c < 0)
                low = mid + 1
            else if (c > 0)
                high = mid - 1
            else
                return mid // key found
        }
        return -(low + 1)  // key not found.
    }

    insert(e: T): number {
        let i = this.find(e)
        if (i < 0) i = -i - 1
        this.items.splice(i, 0, e)
        return i
    }
    
    remove(e: T): number {
        let i = this.find(e)
        if (i >= 0)
            this.items.splice(i, 1)
        return i
    }
}

//
// manage persistent state
//

type Save = {
    ppi: number,
    magnification: number,
    scores: {
        [path: string]: {
            open: boolean,
            scrollTop: number
            magnification: number
        }
    }
    [field: string]: any
}

class State {

    static byPath: {[path: string]: Score} = {}

    static defaultState: Save = {
        ppi: 96, // default is nominal css pixels per inch
        magnification: 1,
        scores: {}
    }
    static state: Save = State.defaultState

    private static fn = process.env.HOME + '/.viewer';
    private static pendingStart = 0
    private static interval = 1000; // ms

    static init(dn: string) {

        // load saved state, supplying defaults if necessary
        try {
            log('loading', State.fn)
            const state: Save = JSON.parse(fs.readFileSync(State.fn).toString())
            for (const key in State.defaultState)
                State.state[key] = state[key] || State.defaultState[key]
        } catch (e) {
            log(State.fn + ': ' + e)
        }

        // populate with files, initializing each score to saved state
        log('reading', dn)
        fs.readdir(dn, (err, items) => {
            for (const fn of items) {
                if ((<any>fn).endsWith('.pdf')) {
                    State.pendingStart++
                    new Score(path.join(dn, fn), fn, (score: Score) => {
                        const scoreState = State.state.scores[score.path]
                        if (scoreState) {
                            if (scoreState.open)
                                ScoreTable.open(score)
                            setTimeout(() => {score.div!.scrollTop = scoreState.scrollTop}, 100) 
                        }
                        State.pendingStart--
                    })
                }
            }
            State.go()
        })
        
        // watch for changes
        fs.watch(dn, {}, (e, fn) => {
            if ((<any>fn).endsWith('.pdf')) {
                log('watch:', e, fn)
                const p = path.join(dn, fn)
                const score = State.byPath[p]
                if (score)
                    score.read()
                else
                    new Score(p, fn)
            }
        })
    }

    private static go() {
        if (State.pendingStart) {
            log('pendingStart', State.pendingStart)
        } else {
            State.state.scores = {}
            for (const path in State.byPath) {
                const score = State.byPath[path]
                State.state.scores[path] = {
                    open: $(score.div!).is(':visible'),
                    scrollTop: score.div!.scrollTop,
                    magnification: score.magnification
                }
                try {
                    const fnNew = State.fn + '-new'
                    fs.writeFileSync(fnNew, JSON.stringify(State.state, null, 2))
                    fs.renameSync(fnNew, State.fn)
                } catch (e) {
                    log(State.fn + ': ' + e)
                }
            }
        }
        setTimeout(State.go, State.interval)
    }
}

//
// ephemeral state
//

let showing: HTMLElement
let lastShowing: HTMLElement | null

function elt(e: HTMLElement | null) {
    return e? e.tagName+':'+e.id : 'null'
}

function show(what: HTMLElement) {
    log('show what:', elt(what), 'showing:', elt(showing))
    if (showing != what) {
        showing = what
        showing.scrollIntoView({behavior: 'smooth'})
    }
}

function navigate(op: 1 | -1 | 'scoreList' | 'lastShowing' | 'toggle' ) {
    const visible = $('.score, #score-list').filter(':visible')
    const scoreList = document.getElementById('score-list')!
    if (op == 'scoreList') {
        if (showing != scoreList) {
            lastShowing = showing
            show(scoreList)
        }
    } else if (op == 'lastShowing') {
        if (showing == scoreList && lastShowing) {
            show(lastShowing)
        }
    } else if (op == 'toggle') {
        if (showing != scoreList) {
            lastShowing = showing
            show(scoreList)
        } else if (lastShowing) {
            show(lastShowing)
        }
    } else {
        let i = visible.index(showing) + op
        if (i < 0)
            i = 0
        if (i >= visible.length)
            i = visible.length - 1
        show(visible[i])
    }
}

$(document).ready(() => {

    let dn = '../scores'
    for (const arg of remote.process.argv) {
        if (arg == '--test')
            dn = '/tmp/scores'
    }
    State.init(dn)
    remote.BrowserWindow.getAllWindows()[0].show()

    //
    // wheel events move between scores
    // works well with 2-finger scroll on osx
    // 

    let lastWheel = 0
    $('body').on('wheel', (e: any) => {
        const dx = e.originalEvent.deltaX
        const dy = e.originalEvent.deltaY
        if (Math.abs(dx) > 2 * Math.abs(dy)) {
            const dt = e.timeStamp - lastWheel
            lastWheel = e.timeStamp
            if (dt < 40)
                return
            navigate(dx > 0? 1 : -1)
        }
    })

    $(window).on('resize', () => {
        const s = $(showing)[0]
        if (s)
            s.scrollIntoView({})
    })
                 
    $(document).on('keydown', (e) => {
        //log(e.key)
        let handled = true
        if (e.key == 'ArrowLeft')
            navigate(e.shiftKey? 'scoreList' : -1)
        else if (e.key == 'ArrowRight')
            navigate(e.shiftKey? 'lastShowing' : 1)
        else if (e.key == 'Tab' || e.key == 'Enter')
            navigate('toggle')
        else
            handled = false
        if (handled)
            e.preventDefault()
    })
})

type Key = string[]

class ScoreTable {

    static closer = '❌'

    static sorted: SortedArray<Key> = new SortedArray((a, b) => a > b? 1 : a < b? -1 : 0)

    static close(score: Score) {
        if (showing == score.div) {
            const visible = $('.score, #score-list').filter(':visible')
            const i = visible.index(score.div!)
            if (i == visible.length - 1)
                show(visible[i-1])
            else
                showing = visible[i+1]
        }
        //score.unrender() ???
        $(score.div!).hide()
        $(score.stateCell!).text('')
    }
    
    static open(score: Score) {
        score.render()
        $(score.div!).show()
        $(score.stateCell!).text(ScoreTable.closer)
    }

    static add(score: Score, oldKey: Key | null): number {

        let tr: HTMLElement

        if (oldKey) {
            const i = ScoreTable.sorted.remove(oldKey)
            assert.ok(i >= 0, 'key not found in ScoreTable.sorted')
            // +1 assumes one row for table heading
            tr = $('#score-list-table').find('tr')[i+1]
            $(tr).remove()
            assert.ok(State.byPath[score.path]==score, 'score not found in State.byPath')
        } else {
            State.byPath[score.path] = score
            tr = $('<tr>')[0]
            score.stateCell = $('<td>')
                .addClass('score-state')
                .appendTo(tr)[0]
            $('<td>')
                .addClass('score-title')
                .appendTo(tr)
            $('<td>')
                .addClass('score-subtitle')
                .appendTo(tr)
            $('<td>')
                .addClass('score-author')
                .appendTo(tr)
        }

        // add click
        $(tr).on('click', (e) => {
            log('click', elt(e.target), elt(e.currentTarget))
            if (e.target == score.stateCell) {
                if ($(e.target).text() == ScoreTable.closer) {
                    ScoreTable.close(score)
                } else {
                    ScoreTable.open(score)
                }
            } else {
                ScoreTable.open(score)
                show(score.div!)
            }
        })

        // insert or move tr into proper place in table, set author and title
        const i = ScoreTable.sorted.insert(score.key!)
        // insert after assumes one row for table heading
        $(tr).insertAfter($('#score-list-table').find('tr')[i])
        $(tr).find('.score-title').text(score.title)
        $(tr).find('.score-subtitle').text(score.subtitle)
        $(tr).find('.score-author').text(score.author)
        return i
    }

    static remove(path: string) {
        const score = State.byPath[path]
        if (score) {
            ScoreTable.close(score)
            const i = ScoreTable.sorted.remove(score.key!)
            // +1 assumes one row for table heading
            if (i >= 0)
                $('#score-list-table').find('tr')[i+1].remove()
            $(score.div!).remove()
        }
    }
}

class Score {

    static ids = 0

    path: string
    id: string
    div: HTMLElement | null = null
    stateCell: HTMLElement | null = null
    magnification: number = 1

    pdf: PDFDocumentProxy | null = null
    author: string = ''
    title: string // default supplied by constructor
    subtitle: string = ''
    key: Key | null = null

    constructor(path: string, fn: string, ready?: (score: Score) => void) {

        this.path = path
        this.title = fn // default
        this.id = 'score-' + (Score.ids++)

        // read pdf file
        this.read(ready)
    }

    // read or re-read pdf file
    read(ready?: (score: Score) => void) {

        // function to pad numbers with 0s so they sort in proper numeric order
        const key = (s: string) => {
            const zs = '0000000000'
            return s.split(' ').map(w => isNaN(<any>w)? w : (zs+w).substring(w.length, zs.length+w.length)).join(' ').toLowerCase()
        }

        // if file disappears we remove ourselves from the score table
        const error = (where: string, reason: string) => {
            log('error', where, this.path, reason)
            if (!fs.existsSync(this.path)) {
                log('removing Score for', this.path)
                ScoreTable.remove(this.path)
            }
        }

        // read pdf file
        PDFJS.getDocument(this.path).then(

            // success reading file
            (pdf) => {

                // get metadata
                this.pdf = pdf
                this.pdf.getMetadata().then(

                    // success getting metadata
                    (md) => {

                        // get metadata, compute key
                        const oldKey = this.key
                        log('read', this.path, pdf.numPages, 'pages')
                        this.title = md.info.Title || this.title
                        this.subtitle = md.info.Subtitle || md.info.Subject || ''
                        this.author = md.info.Author || '\x7f' // no author sorts to end
                        this.key = [key(this.author), key(this.title), key(this.subtitle)]
                        
                        // add to score table, getting sort order i
                        const i = ScoreTable.add(this, oldKey)
                        
                        // start with existing or new empty div
                        if (!this.div) {
                            // create our div, insert in correct order, start hidden
                            this.div = $('<div>')
                                .attr('id', this.id)
                                .addClass('score')
                                .hide()[0]
                            $('<div>')
                                .addClass('score-state')
                                .addClass('score-closer')
                                .text(ScoreTable.closer)
                                .on('click', () => ScoreTable.close(this))
                                .appendTo(this.div)
                            $(this.div).on('dblclick', (e) => {
                                this.addMarker(e.clientX!, e.clientY! + this.div!.scrollTop)
                            })
                        } else {
                            // use existing div, remove canvases to force re-render
                            $(this.div).find('canvas').remove()
                        }

                        // put div in the proper position
                        const scores = $('.score')
                        if (i >= scores.length)
                            $(this.div).appendTo('#top')
                        else
                            $(this.div).insertBefore(scores[i])

                        // render score if it was an existing visible div
                        if ($(this.div).is(':visible'))
                            this.render()

                        // callback when ready
                        if (ready)
                            ready(this)
                    },

                    // error getting metadata
                    (reason) => error('getting metadata', reason)
                )
            },

            // error reading page
            (reason) => error('reading', reason)
        )
    }

    render() {

        // nothing to render
        if (!this.pdf)
            return

        // already rendered
        if ($(this.div!).find('canvas').length)
            return

        //for each page
        for (let i = 1; i <= this.pdf.numPages; i++) {

            // create a canvas, add to our div
            const canvas = <HTMLCanvasElement> $('<canvas>')
                .addClass('score-canvas')
                .appendTo(this.div!)[0]

            // render page i into the canvas
            this.pdf.getPage(i).then((page) => {
                const viewport = page.getViewport(State.state.ppi * window.devicePixelRatio / 72)
                canvas.width = viewport.width
                canvas.height = viewport.height
                const screenWidth = screen.width * window.devicePixelRatio
                const scoreWidth = State.state.magnification * this.magnification * viewport.width
                canvas.style.width = (scoreWidth / screenWidth * 100) + 'vw'
                page.render({
                    canvasContext: canvas.getContext('2d')!,
                    viewport: viewport
                })
            })
        }
    }

    positionMarker(svg: HTMLElement, x: number, y: number) {
        $(svg).css('left', (100 * x / window.innerWidth) + 'vw')
        $(svg).css('top', (100 * y / window.innerWidth) + 'vw')
    }

    addMarker(x: number, y: number) {
        log('addMarker', x, y)
        const svg = $('<svg><path>')
            .addClass('marker')
            .appendTo(this.div!)
            .on('dblclick', (e) => {
                svg.remove()
                e.stopPropagation()
            })
            .on('mousedown', (e) => {
                let x = e.clientX!, y = e.clientY!
                let scrolling = false
                const scroll = () => {
                    if (y < 10) {
                        this.div!.scrollTop += y - 10
                        this.positionMarker(svg[0], x, y + this.div!.scrollTop)
                        setTimeout(scroll, 50)
                        scrolling = true
                    } else {
                        scrolling = false
                    }
                }
                const mousemove = (e: any) => {
                    x = e.clientX, y = e.clientY
                    this.positionMarker(svg[0], x, y + this.div!.scrollTop)
                    if (!scrolling)
                        scroll()
                }
                $(this.div!).on('mousemove', mousemove);
                $(this.div!).one('mouseup', (e) => {
                    $(this.div!).unbind('mousemove', mousemove)
                })
                window.addEventListener('click', (e) => {
                    e.stopPropagation()
                }, {capture: true, once: true})
            })
        svg
            .attr('viewBox', svg.css('--viewBox'))
            .find('path').attr('d', svg.css('--path'))
        this.positionMarker(svg[0], x, y)
    }
}


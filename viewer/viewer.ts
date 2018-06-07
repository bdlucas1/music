import * as $ from 'jquery'
import * as assert from 'assert'
import * as fs from 'fs'
import * as path from 'path'
import {remote} from 'electron'

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
    scores: {
        [path: string]: {
            open: boolean,
            scrollTop: number
        }
    }
}

class State {

    static byPath: {[path: string]: Score} = {}

    static state: {
        ppi: number,
        scores: {
            [path: string]: {
                open: boolean,
                scrollTop: number
            }
        }
    } = {
        ppi: 96, // default is nominal css pixels
        scores: {}
    }

    private static fn = process.env.HOME + '/.viewer';
    private static pendingStart = 0
    private static interval = 1000; // ms

    static init(dn: string) {

        // load saved state
        try {
            log('loading', State.fn)
            State.state = JSON.parse(fs.readFileSync(State.fn).toString())
        } catch (e) {
            log(State.fn + ':' + e)
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
                    scrollTop: score.div!.scrollTop
                }
                try {
                    fs.writeFileSync(State.fn, JSON.stringify(State.state, null, 2))
                } catch (e) {
                    log(State.fn + ':' + e)
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

function elt(e: HTMLElement | null) {
    return e? e.tagName+':'+e.id : 'null'
}

function show(what: HTMLElement) {
    if (showing != what) {
        log('show', elt(what))
        showing = what
        showing.scrollIntoView({behavior: 'smooth'})
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
            const visible = $('.score, #score-list').filter(':visible')
            const i = visible.index(showing) + (dx > 0? 1 : -1)
            if (i >= 0 && i < visible.length)
                show(visible[i])
        }
    })

    //
    // drag gesture swaps between score list and current showing score
    // works well with 3-finger drag on osx
    //

    let lastShowing: HTMLElement | null
    let mouseMovement = 0

    $('body').on('mousemove', (e: any) => {
        if (e.buttons) {
            mouseMovement = e.originalEvent.movementX
            const scoreList = document.getElementById('score-list')!
            if (mouseMovement > 0 && showing != scoreList) {
                lastShowing = showing
                show(scoreList)
                log('lastShowing now', elt(lastShowing))
            } else if (mouseMovement < 0 && showing == scoreList && lastShowing) {
                log('lastShowing', elt(lastShowing))
                show(lastShowing)
            }
        }
    })

    // capture click if it resulted from a drag gesture
    $('body')[0].addEventListener('click', (e) => {
        if (mouseMovement)
            e.preventDefault()
        mouseMovement = 0
    }, true)

    $(window).on('resize', () => {
        $(showing)[0].scrollIntoView({})
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
        $(tr).find('.score-author').text(score.author)
        $(tr).find('.score-title').text(score.title)
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

    pdf: PDFDocumentProxy | null = null
    author: string = ''
    title: string // default supplied by constructor
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
                        this.author = md.info.Author || '\x7f' // no author sorts to end
                        this.key = [key(this.author), key(this.title)]
                        
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
                canvas.style.width = (viewport.width / screenWidth * 100) + 'vw'
                page.render({
                    canvasContext: canvas.getContext('2d')!,
                    viewport: viewport
                })
            })
        }
    }
}


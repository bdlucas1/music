import * as $ from 'jquery'
import * as fs from 'fs'
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

    private bs(e: T): number {
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
        let i = this.bs(e)
        if (i < 0) i = -i - 1
        this.items.splice(i, 0, e)
        return i
    }
    
    remove(e: T): number {
        let i = this.bs(e)
        if (i >= 0)
            this.items.splice(i, 1)
        return i
    }
}

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
    log('reading', dn)
    readScores(dn)
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

class ScoreTable {

    static closer = '❌'

    static sorted: SortedArray<Score> = new SortedArray((a, b) => {
        return a.key > b.key? 1 : a.key < b.key? -1 : 0
    })
    static byPath: {[path: string]: Score} = {}

    static close(score: Score) {
        const visible = $('.score, #score-list').filter(':visible')
        const i = visible.index(score.div!)
        if (i == visible.length - 1)
            show(visible[i-1])
        //score.unrender() ???
        $(score.div!).hide()
        $(score.stateCell!).text('')
        
    }
    
    static open(score: Score) {
        score.render()
        $(score.div!).show()
        $(score.stateCell!).text(ScoreTable.closer)
    }

    static add(score: Score): number {
        ScoreTable.byPath[score.path] = score
        const i = ScoreTable.sorted.insert(score)
        // insert after assumes one row for table heading
        const after = $('#score-list-table').find('tr')[i]
        const tr = $('<tr>')
            .on('click', (e) => {
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
            .insertAfter(after)
        score.stateCell = $('<td>')
            .addClass('score-state')
            .appendTo(tr)[0]
        $('<td>')
            .addClass('score-title')
            .text(score.title)
            .appendTo(tr)
        $('<td>')
            .addClass('score-author')
            .text(score.author)
            .appendTo(tr)
        return i
    }

    static remove(path: string) {
        const score = ScoreTable.byPath[path]
        if (score) {
            const i = ScoreTable.sorted.remove(score)
            // +1 assumes one row for table heading
            if (i >= 0)
                $('#score-list-table').find('tr')[i+1].remove()
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
    title: string = ''
    key: string[] = []

    constructor(dn: string, fn: string) {

        this.path = dn + '/' + fn
        this.id = 'score-' + (Score.ids++)

        // if anything goes wrong we remove ourselves from the score table
        const error = (where: string, reason: string) => {
            log('error', where, this.path)
            log(reason)
            ScoreTable.remove(this.path)        
        }

        // function to pad numbers with 0s so they sort in proper numeric order
        const key = (s: string) => {
            const zs = '0000000000'
            return s.split(' ').map(w => isNaN(<any>w)? w : (zs+w).substring(w.length, zs.length+w.length)).join(' ').toLowerCase()
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
                        log('opened', this.path, pdf.numPages, 'pages')
                        this.title = md.info.Title || fn
                        this.author = md.info.Author || '\x7f' // no author sorts to end
                        this.key = [key(this.author), key(this.title)]
                        
                        // add to score table, getting sort order i
                        ScoreTable.remove(this.path);
                        const i = ScoreTable.add(this)
                        
                        // get or construct empty div for our canvases
                        const div = document.getElementById(this.id)
                        if (!div) {
                            // create new div, insert in correct order, start hidden
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
                            const scores = $('.score')
                            if (i >= scores.length)
                                $(this.div).appendTo('#top')
                            else
                                $(this.div).insertBefore(scores[i])
                        } else {
                            // use existing div, empty it
                            this.div = div
                            $(this.div).find('*').remove()
                        }

                        // render score if it was an existing visible div
                        if ($(this.div).is(':visible'))
                            this.render()
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
                const scale = 4 // optimal value??
                const viewport = page.getViewport(scale)
                canvas.width = viewport.width
                canvas.height = viewport.height
                //canvas.style.width = '100vw'
                //canvas.style.height = (100 * canvas.height / canvas.width) + 'vw'
                //canvas.style.width = '8.5in'
                canvas.style.height = '180vh'
                page.render({
                    canvasContext: canvas.getContext('2d')!,
                    viewport: viewport
                })
            })
        }
    }
}

function readScores(dn: string) {

    // populate with files
    fs.readdir(dn, (err, items) => {
        for (const fn of items)
            if ((<any>fn).endsWith('.pdf'))
                new Score(dn, fn)
    })

    // watch for changes
    fs.watch(dn, {}, (e, fn) => {
        if ((<any>fn).endsWith('.pdf')) {
            log('watch:', e, fn)
            new Score(dn, fn)
        }
    })
}

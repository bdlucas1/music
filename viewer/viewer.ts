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

function show(what: HTMLElement) {
    if (showing != what) {
        log('show', what instanceof HTMLElement? what.tagName+':'+what.id : what)
        showing = what
        $(showing)[0].scrollIntoView({behavior: 'smooth'})
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

    $(window).on('resize', () => {
        $(showing)[0].scrollIntoView({})
    })
                 
})

class ScoreTable {

    static dot = '🔵'

    static sorted: SortedArray<Score> = new SortedArray((a, b) => a.compare(b))
    static byPath: {[path: string]: Score} = {}

    static add(score: Score) {
        ScoreTable.byPath[score.path] = score
        const i = ScoreTable.sorted.insert(score)
        // insert after assumes one row for table heading
        const after = $('#score-list-table').find('tr')[i]
        const tr = $('<tr>')
            .on('click', () => {
                score.render()
                $(score.div).show()
                show(score.div)
                tr.find('.score-state').text(ScoreTable.dot)
            })
            .insertAfter(after)
        $('<td>')
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

    pdf: PDFDocumentProxy | null = null
    author: string = ''
    title: string = ''
    key: string[] = []

    div: HTMLElement

    constructor(dn: string, fn: string) {

        this.path = dn + '/' + fn
        this.id = 'score-' + (Score.ids++)

        // get or create our empty <div> container
        const div = document.getElementById(this.id)
        if (!div) {
            this.div = $('<div>')
                .attr('id', this.id)
                .addClass('score')
                .appendTo('#top')
                .hide()[0]
        } else {
            this.div = div
            $(this.div).find('*').remove()
        }

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

        // open pdf, read metadata
        PDFJS.getDocument(this.path).then(
            (pdf) => {
                this.pdf = pdf
                this.pdf.getMetadata().then(
                    (md) => {
                        log('opened', this.path, pdf.numPages, 'pages')
                        this.title = md.info.Title || fn
                        this.author = md.info.Author || '\x7f' // no author sorts to end
                        this.key = [key(this.author), key(this.title)]
                        ScoreTable.remove(this.path);
                        ScoreTable.add(this)
                        if ($(this.div).is(':visible'))
                            this.render()
                    },
                    (reason) => error('getting metadata', reason)
                )
            },
            (reason) => error('reading', reason)
        )
    }

    compare(that: Score): number {
        return this.key > that.key? 1 : this.key < that.key? -1 : 0
    }

    render() {
        if (!this.pdf)
            return
        if ($(this.div).find('canvas').length)
            return
        for (let i = 1; i <= this.pdf.numPages; i++) {
            log('rendering', this.path, 'page', i)
            const canvas = <HTMLCanvasElement> $('<canvas>')
                .addClass('score-canvas')
                .appendTo(this.div)[0]
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

    fs.readdir(dn, (err, items) => {
        for (const fn of items)
            if ((<any>fn).endsWith('.pdf'))
                new Score(dn, fn)
    })

    fs.watch(dn, {}, (e, fn) => {
        if ((<any>fn).endsWith('.pdf')) {
            log('watch:', e, fn)
            new Score(dn, fn)
        }
    })
}

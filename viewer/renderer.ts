/*
next:
skin table
add "open" column
get title etc. from pdf; alphabetize
highlight current score
arrow keys to navigate
    l/r in scores view to circulate
    u/d in score-list view to select, enter to open
remove horizontal scrollbar
*/


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

let showing: '#score-list' | '#scores' = '#score-list'

function show(what: '#score-list' | '#scores') {
    showing = what
    $(showing)[0].scrollIntoView({behavior: 'smooth'})
}

function showIfNeeded(what: '#score-list' | '#scores') {
    if (showing != what)
        show(what)
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

    $('body').on('wheel', (e: any) => {
        const dx = e.originalEvent.deltaX
        const dy = e.originalEvent.deltaY
        if (Math.abs(dx) > 2 * Math.abs(dy))
            showIfNeeded(dx > 0? '#scores' : '#score-list')
    })

    $(window).on('resize', () => {
        $(showing)[0].scrollIntoView({})
    })
                 
})


class ScoreTable {

    static dot = '🔵'

    static sorted: SortedArray<Score> = new SortedArray((a, b) => a.compare(b))
    static byPath: {[fn: string]: Score} = {}

    static add(score: Score) {
        ScoreTable.byPath[score.path] = score
        const i = ScoreTable.sorted.insert(score)
        // insert after assumes one row for table heading
        const after = $('#score-list-table').find('tr')[i]
        const tr = $('<tr>')
            .on('click', () => {
                score.render()
                $('#scores').find('div').hide()
                $(score.div).show()
                show("#scores")
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

    fn: string
    path: string

    pdf: PDFDocumentProxy | null = null
    author: string = ''
    title: string = ''
    key: string[] = []

    div: HTMLElement

    constructor(dn: string, fn: string, show: boolean) {

        this.fn = fn
        this.path = dn + '/' + fn

        // get or create our empty <div> container
        const id = this.fn
        const div = document.getElementById(id)
        if (!div) {
            this.div = $('<div>')
                .attr('id', id)
                .addClass('score')
                .appendTo('#scores')
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

        // open pdf, read metadata
        PDFJS.getDocument(this.path).then(
            (pdf) => {
                this.pdf = pdf
                this.pdf.getMetadata().then(
                    (md) => {
                        log('opened', this.path)
                        this.title = md.info.Title || fn
                        this.author = md.info.Author || '\x7f' // no author sorts to end
                        this.key = [this.author.toLowerCase(), this.title.toLowerCase()]
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
        log('rendering', this.path)
        const canvas = <HTMLCanvasElement> $('<canvas>')
            .addClass('score-canvas')
            .appendTo(this.div)[0]
        this.pdf.getPage(1).then((page) => {
            const scale = 4 // optimal value??
            const viewport = page.getViewport(scale)
            canvas.width = viewport.width
            canvas.height = viewport.height
            //canvas.style.width = '100vw'
            //canvas.style.height = (100 * canvas.height / canvas.width) + 'vw'
            canvas.style.height = '160vh'
            page.render({
                canvasContext: canvas.getContext('2d')!,
                viewport: viewport
            })
        })
    }
}

function readScores(dn: string) {

    fs.readdir(dn, (err, items) => {
        for (const fn of items)
            if ((<any>fn).endsWith('.pdf'))
                new Score(dn, fn, false)
    })

    fs.watch(dn, {}, (e, fn) => {
        if ((<any>fn).endsWith('.pdf')) {
            log('watch:', e, fn)
            new Score(dn, fn, true)
        }
    })
}

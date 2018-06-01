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

const con = remote.getGlobal('console')

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

    bs(e: T): number {
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
    con.log('reading', dn)
    readScores(dn)
    remote.BrowserWindow.getAllWindows()[0].show()

    $('body').on('wheel', (e) => {
        const dx = e.originalEvent.deltaX
        const dy = e.originalEvent.deltaY
        if (Math.abs(dx) > 2 * Math.abs(dy))
            showIfNeeded(dx > 0? '#scores' : '#score-list')
    })

    $(window).on('resize', () => {
        $(showing)[0].scrollIntoView({})
    })
                 
})


class Score {

    static current: Score | null = null
    static sorted: SortedArray<Score> = new SortedArray((a, b) => a.compare(b))
    static byPath: {[fn: string]: Score} = {}

    path: string
    pdf: PDFDocumentProxy | null = null
    div: HTMLElement | null = null
    state: HTMLElement | null = null
    author: string = ''
    title: string = ''
    key: string[] = []

    constructor(dn: string, fn: string) {
        this.path = dn + '/' + fn
        PDFJS.getDocument(this.path).then((pdf) => {
            Score.byPath[this.path] = this
            this.pdf = pdf
            this.pdf.getMetadata().then((md) => {
                this.title = md.info.Title || fn
                this.author = md.info.Author || '\x7f' // no author sorts to end
                this.key = [this.author.toLowerCase(), this.title.toLowerCase()]
                const i = Score.sorted.insert(this)
                const table = $('#score-list-table')
                const trs = table.find('tr')
                const before = trs[i]
                const tr = $('<tr>')
                    .attr('id', fn)
                    .on('click', () => {this.show()})
                    .insertBefore(before)
                this.state = $('<td>')
                    .addClass('score-state')
                    .appendTo(tr)[0]
                $('<td>')
                    .addClass('score-title')
                    .text(this.title)
                    .appendTo(tr)
                $('<td>')
                    .addClass('score-author')
                    .text(this.author)
                    .appendTo(tr)

            })
        })
    }

    compare(that: Score): number {
        return this.key > that.key? 1 : this.key < that.key? -1 : 0
    }

    remove() {
        const i = Score.sorted.remove(this)
        $('#score-list-table').find('tr')[i].remove()
        delete Score.byPath[this.path]
        if (Score.current == this)
            Score.current = null
        if (this.div)
            $(this.div).remove()
    }

    show() {
        if (this.pdf==null)
            return;
        const dot = '🔵'
        $(this.state!).text(dot)
        if (this.div==null) {
            this.div = $('<div>')
                .addClass('score')
                .appendTo('#scores')[0]
            const canvas = <HTMLCanvasElement> $('<canvas>')
                .addClass('score-canvas')
                .appendTo(this.div)[0]
            this.pdf.getPage(1).then((page) => {
                const scale = 4 // optimal value??
                const viewport = page.getViewport(scale)
                canvas.width = viewport.width
                canvas.height = viewport.height
                canvas.style.width = '100vw'
                canvas.style.height = (100 * canvas.height / canvas.width) + 'vw'
                page.render({
                    canvasContext: canvas.getContext('2d')!,
                    viewport: viewport
                })
            })
        }
        if (Score.current)
            $(Score.current.div!).hide()
        Score.current = this
        $(this.div).show()
        show("#scores")
    }
}

function readScores(dn: string) {

    fs.readdir(dn, (err, items) => {
        for (const fn of items) {
            if ((<any>fn).endsWith('.pdf')) {
                new Score(dn, fn)
            }
        }
    })

    fs.watch(dn, {}, (e, fn) => {
        const path = dn + '/' + fn
        let score = Score.byPath[path]
        const current = score == Score.current
        if (score)
            score.remove()
        if ((<any>fn).endsWith('.pdf'))
            score = new Score(dn, fn)
        if (current)
            score.show()
    })
}

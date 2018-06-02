import {app, BrowserWindow} from 'electron'

// avoid being garbage collected
let win : BrowserWindow | null

app.on('ready', () => {
    win = new BrowserWindow({
        width: 1024,
        height: 640,
        show: false
        //webPreferences: {plugins: true}
    })

    win.loadFile('viewer.html')

    win.on('closed', function () {
        win = null
    })
})

// Quit when all windows are closed.
app.on('window-all-closed', function () {
    if (true /*process.platform !== 'darwin'*/) {
        app.quit()
    }
})

/*
app.on('activate', function () {
    // On OS X it's common to re-create a window in the app when the
    // dock icon is clicked and there are no other windows open.
    if (wina === null) {
        createWindow()
    }
})
*/

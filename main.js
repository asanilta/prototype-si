'use strict';

const electron = require('electron');
// Module to control application life.
const app = electron.app;
// Module to create native browser window.
const BrowserWindow = electron.BrowserWindow;

// Keep a global reference of the window object, if you don't, the window will
// be closed automatically when the JavaScript object is garbage collected.
let mainWindow;

function createWindow () {
  // Create the browser window.
  mainWindow = new BrowserWindow({width: 800, height: 600});
  mainWindow.maximize();

  // and load the index.html of the app.
  mainWindow.loadURL('file://' + __dirname + '/views/index.html');

  // Emitted when the window is closed.
  mainWindow.on('closed', function() {
    // Dereference the window object, usually you would store windows
    // in an array if your app supports multi windows, this is the time
    // when you should delete the corresponding element.
    mainWindow = null;
  });
}

// This method will be called when Electron has finished
// initialization and is ready to create browser windows.
app.on('ready', createWindow);

// Quit when all windows are closed.
app.on('window-all-closed', function () {
  // On OS X it is common for applications and their menu bar
  // to stay active until the user quits explicitly with Cmd + Q
  if (process.platform !== 'darwin') {
    app.quit();
  }
});

app.on('activate', function () {
  // On OS X it's common to re-create a window in the app when the
  // dock icon is clicked and there are no other windows open.
  if (mainWindow === null) {
    createWindow();
  }

  //setup express
  //  var express  = require('express');
  //  expressApp = express();
  //  var bodyParser = require('body-parser');
  //  expressApp.set('views', path.join(__dirname, 'views'));
  //  expressApp.use(express.static(__dirname + '/public'));
  //  expressApp.use(bodyParser.urlencoded({'extended':'true'}));            // parse application/x-www-form-urlencoded
  //  expressApp.use(bodyParser.json());                                     // parse application/json
  //  expressApp.use(bodyParser.json({ type: 'application/vnd.api+json' })); // parse application/vnd.api+json as json
  //  expressApp.use(methodOverride());
  //  expressApp.listen(8080);
  //  console.log("App listening on port 8080");


});

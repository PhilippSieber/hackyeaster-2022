'use strict';

const express = require('express');
const path = require('path');
const url = require('url');
const pug = require('pug');

// Constants
const PORT = 1337;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', function(req, res) {
  res.send(pug.renderFile('index.pug'));
});
app.get('/styles.css', function(req, res) {
  res.sendFile('/styles.css', { root: path.join(__dirname) });
});
app.get('/script.js', function(req, res) {
  res.sendFile('/script.js', { root: path.join(__dirname) });
});
app.get('/title.png', function(req, res) {
  res.sendFile('/title.png', { root: path.join(__dirname) });
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);

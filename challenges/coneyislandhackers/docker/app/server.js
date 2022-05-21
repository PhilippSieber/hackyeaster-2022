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
  let reqUrl = url.format(url.parse(req.url, true));
  if (!req.query.passphrase) {
    res.send(pug.renderFile('index.pug'));
  } else if (req.query.passphrase.includes(',')) {
    res.send(pug.renderFile('blocked.pug', { message: 'comma found' }));
  } else if ((reqUrl.match(/passphrase=/g) || []).length > 1) {
    res.send(pug.renderFile('blocked.pug', { message: 'passphrase param found more than once' }));
  } else if (req.query.passphrase == 'eat,sleep,hack,repeat') {
    res.send(pug.renderFile('flag.pug'));
  } else {
    res.send(pug.renderFile('nope.pug'));
  }
});
app.get('/styles.css', function(req, res) {
  res.sendFile('/styles.css', { root: path.join(__dirname) });
});
app.get('/title.png', function(req, res) {
  res.sendFile('/title.png', { root: path.join(__dirname) });
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);

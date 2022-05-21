"use strict";

const express = require("express");
const path = require("path");
const pug = require("pug");
const helmet = require("helmet");
const parser = require("body-parser");

// Constants
const PORT = 1337;
const HOST = "0.0.0.0";

// App
const app = express();
app.use(parser.json());
app.use(helmet())

app.get("/", function (req, res) {
  res.send(pug.renderFile("index.pug"));
});

app.post("/order", function (req, res) {
  const reqObj = req.body;
  if (typeof reqObj !== "object" || Object.keys(reqObj).length === 0) {
    res.send("順序が無効です");
    return;
  }
  var validated = {};
  var key;
  for (key of Object.keys(reqObj)) {
      validated[key] = reqObj[key];
      if (key === 'amount') {
        if (!(validated.amount && validated.amount > 0 && validated.amount < 5)) {
          res.send("金額は1から4の間でなければなりません");
          return;
        }
      } else if (key === 'item') {
        if (validated.item === '🚩') {
          res.send("🚩は許可されていません");
          return;
        } else if (!(validated.item === '🧋' || validated.item === '🧃'
        || validated.item === '🍶' || validated.item === '🍱'
        || validated.item === '🍣' || validated.item === '🍫'
        || validated.item === '🍭' || validated.item === '🍩')) {
          res.send("アイテムが見つかりません");
          return;
        }
      }
  }
  if (!(validated.amount > 0 && validated.item != '')) {
    res.send("順序が無効です");
    return;
  }
  if (validated.item === '🚩') {
    res.send("お楽しみください 🚩: he2022{p0llut10n_41nt_g00d}");
  }
  res.send("お楽しみください  " + validated.item + "!");
});

app.get("/styles.css", function (req, res) {
  res.sendFile("/styles.css", { root: path.join(__dirname) });
});

app.get("/title.png", function (req, res) {
  res.sendFile("/title.png", { root: path.join(__dirname) });
});

app.get("/jquery.min.js", function (req, res) {
  res.sendFile("/jquery.min.js", { root: path.join(__dirname) });
});

app.get("/client.js", function (req, res) {
  res.sendFile("/client.js", { root: path.join(__dirname) });
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);

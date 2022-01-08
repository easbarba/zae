"use strict";

const Fs = require('fs')
const Path = require('path')

function commandv(executable) {
  for (let path of process.env.PATH.split(':')) {
    let exe = Path.join(path, executable);

    if (Fs.existsSync(exe)) return exe;
  }
}

module.exports = { commandv };

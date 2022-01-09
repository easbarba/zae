'use strict';

import * as Fsp from 'fs/promises';
import Packagers from './packagers.js';

export default class Packager {
  constructor() {
    this.packagers = new Packagers();
  }

  readFile(file) {
    try {
      const data = await Fsp.readFile(file);
      const obj = JSON.parse(data);

      return obj

    } catch (err) {
      console.log(err);
    }
  }

  execExists() {
    (async () => {
      const stat = await Fsp.lstat(file);

      if (stat.isFile()) return true;
    })().catch(console.error)
  }

  found() {
    for (let file of Object.values(this.packagers.getFiles())) {
      if (this.execExists()) return result;
    }
  }
}

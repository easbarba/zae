'use strict';

import * as Fs from 'fs';
import Packagers from './packagers.js';

export default class Packager {
  packagers = new Packagers();

  readFile(file: string) {
    try {
      const data = Fs.readFileSync(file).toString();
      const obj = JSON.parse(data);

      return obj;
    } catch (err) {
      console.log(err);
    }
  }

  execExists(file: string) {
    try {
      const stat = Fs.lstatSync(file);

      if (stat.isFile()) return true;
    } catch {
      console.error;
    }
  }

  found() {
    const files = Object.values(this.packagers.getFiles());
    let result: string = '';

    for (const file of files) {
      if (this.execExists(file)) {
        result = file;
        break;
      }
    }

    return result;
  }
}

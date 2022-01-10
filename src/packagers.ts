'use strict';

import * as Path from 'path';
import { homedir } from 'os';
import * as Fs from 'fs';

export default class Packagers {
  folder = Path.join(homedir(), '.config', 'distro');

  getFiles() {
    let result: { [a: string]: string } = { apt: '/bin/apt' };

    try {
      const files = Fs.readdirSync(this.folder);

      files.forEach((file) => {
        let ext = Path.extname(file);

        if (ext === '.json') {
          let name = Path.basename(file, '.json');
          result[name] = Path.join(this.folder, file);
        }
      });
    } catch (err) {
      console.log(err);
    }

    return result;
  }
}
'use strict';

import * as Fs from 'fs';
import * as Path from 'path';

export default function commandv(executable) {
  for (let path of process.env.PATH.split(':')) {
    let exe = Path.join(path, executable);

    if (Fs.existsSync(exe)) return exe;
  }
}

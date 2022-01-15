import * as Fs from 'fs'

import Packagers from './packagers.js'

export default class Packager {
  packagers

  constructor() {
    this.packagers = new Packagers()
  }

  }

  execExists(file) {
    try {
      const stat = Fs.lstatSync(file)

      if (stat.isFile()) return true
    } catch {
      console.error
    }
  }

  found() {
    const files = Object.values(this.packagers.getFiles())
    let result = ''

    for (const file of files) {
      if (this.execExists(file)) {
        result = file
        break
      }
    }

    return result
  }
}

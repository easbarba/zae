import * as Fs from 'fs'

import Packagers from './packagers.js'
import { commandv } from './services/utils.js'

export default class Packager {
  packagers

  static #execExists(file) {
    const { exec } = Packagers.readFile(file)
    return commandv(exec)
  }

  constructor() {
    this.packagers = new Packagers()
  }

  found() {
    const files = Object.values(this.packagers.getFiles())
    let result = ''

    for (const file of files) {
      if (Packager.#execExists(file)) {
        result = file
        break
      }
    }

    return result
  }
}

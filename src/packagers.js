import * as Path from 'path'
import { homedir } from 'os'
import * as Fs from 'fs'

import * as Yaml from 'js-yaml'

export default class Packagers {
  folder = Path.join(homedir(), '.config', 'distrojs')

  static readFile(file) {
    try {
      const data = Fs.readFileSync(file, 'utf8')
      const fileReaded = Yaml.load(data)

      return fileReaded
    } catch (err) {
      console.log(err)
    }

    return undefined
  }

  getFiles() {
    let result = {}
    const extension = '.yml'

    try {
      const files = Fs.readdirSync(this.folder)

      files.forEach((file) => {
        const ext = Path.extname(file)

        if (ext === extension) {
          const name = Path.basename(file, extension)
          result[name] = Path.join(this.folder, file)
        }
      })
    } catch (err) {
      console.log(err)
    }

    return result
  }
}

'use strict'

import * as Path from 'path'
import { homedir } from 'os'
import * as Fs from 'fs'

export default class Packagers {
    folder = Path.join(homedir(), '.config', 'distrojs')

    getFiles() {
        let result = { apt: '/bin/apt' }

        try {
            const files = Fs.readdirSync(this.folder)

            files.forEach((file) => {
                let ext = Path.extname(file)

                if (ext === '.yml') {
                    let name = Path.basename(file, '.yml')
                    result[name] = Path.join(this.folder, file)
                }
            })
        } catch (err) {
            console.log(err)
        }

        return result
    }
}

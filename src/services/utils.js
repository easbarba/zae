import * as Fs from 'fs'
import * as Path from 'path'

/**
 * mimics unix command -v
 * @param {string} - executable to be find.
 */
export default function commandv(executable) {
    const pathes = process.env.PATH?.split(':') ?? [
        '/bin',
        '/usr/bin',
        '/sbin/',
    ]
    let found = ''

    for (const path of pathes) {
        const exe = Path.join(path, executable)

        if (Fs.statSync(exe).isFile()) {
            found = exe
            break
        }
    }

    return found
}

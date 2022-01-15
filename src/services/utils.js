import * as Fs from 'fs'

/**
 * mimics unix command -v
 * @param {string} - executable to be find.
 */
function commandv(executable) {
  let flag = true

  try {
    Fs.accessSync(executable, Fs.constants.F_OK)
  } catch (err) {
    flag = false
  }

  return flag
}

export { commandv }

'use strict'

import ParsedCommands from './parsed-commands.js'
import Packager from './packager.js'

export default class Index {
  action

  constructor(action) {
    this.action = action
  }

  packager() {
    const packager = new Packager()
    packager.found()
  }

  commands() {
    let commands = new ParsedCommands().all()
    return commands
  }

  real_action() {}

  need() {}

  final_command() {}

  run() {
    return this.action
  }
}

const i = new Index('install')
console.log(i.packager())

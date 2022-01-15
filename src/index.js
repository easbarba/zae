import Chalk from 'chalk'

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

  final_command() {
    this.packager()
  }

  info() {
    console.log(Chalk.blue(`command: ${this.action}`))
    console.log(Chalk.green(`arguments: ${this.arguments}`))
    console.log(Chalk.red(`running: ${this.final_command()}`))
  }

  run() {
    return this.action
  }
}

const i = new Index('install')
console.log(i.packager())

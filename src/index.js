import Chalk from 'chalk'

import ParsedCommands from './parsed-commands.js'
import Packager from './packager.js'

export default class Index {
  action = ''
  arguments = ''

  constructor(args) {
    this.action = action
    this.arguments = args
  }

  packager() {
    const packager = new Packager()
    packager.found()
  }

  commands() {
    const commands = new ParsedCommands().all()
    return commands
  }

  real_action() {}

  need() {}

  final_command() {
    this.packager()
  }

  info() {
    console.log(Chalk.blue('command:'), this.action)
    console.log(Chalk.green('arguments:'), this.arguments)
    console.log(Chalk.red('running:'), this.final_command())
  }

  run() {
    this.info()

    this.final_command()
  }
}

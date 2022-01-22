import ParsedCommands from './parsed_commands.js'
import Packager from './packager.js'
import Logger from './logger.js'
import Info from './info.js'

export default class Index {
  action = undefined
  arguments = undefined

  constructor(args) {
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
    const info = new Info(this.action, this.arguments)
    info.put()
  }

  log() {
    const logger = new Logger(this.action, this.arguments)
    logger.put()
  }

  run() {
    this.log()
    this.info()

    this.final_command()
  }
}

import Chalk from 'chalk'

export default class Info {
  action = undefined
  arguments = undefined

  constructor(action, args) {
    this.action = action
    this.arguments = args
  }

  put() {
    console.log(Chalk.blue('command:'), this.action)
    console.log(Chalk.green('arguments:'), this.arguments)
  }
}

export { Info }

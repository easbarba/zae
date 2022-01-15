import Pino from 'pino'

const logger = Pino(
  {
    transport: {
      target: 'pino-pretty',
      options: {
        colorize: true,
      },
    },
  },
  Pino.destination({ dest: '/root/.local/share/distro/misc.log', sync: false })
)

export default class Logger {
  action = undefined
  arguments = undefined

  constructor(action, args) {
    this.action = action
    this.arguments = args
  }

  put() {
    logger.info(`'command: ${this.action}`)
  }
}

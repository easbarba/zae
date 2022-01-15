import pino from 'pino'

const Logger = pino(
  {
    transport: {
      target: 'pino-pretty',
      options: {
        colorize: true,
      },
    },
  },
  pino.destination({ dest: '/root/.local/share/distro/misc.log', sync: false })
)

class Logger {
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

export { Logger }

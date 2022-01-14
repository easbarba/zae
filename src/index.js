'use strict'

import ParsedCommands from './parsed-commands.js'

export default class Index {
    action

    constructor(action) {
        this.action = action
    }

    packager() {}

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

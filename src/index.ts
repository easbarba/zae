'use strict';

import ParsedCommands from './parsed-commands.js';

export default class Index {
  action: string;

  constructor(action: string) {
    this.action = action;
  }

  packager() {}

  commands() {
    let commands = new ParsedCommands().all();
    return commands;
  }

  real_action() {}

  need() {}

  final_command() {}

  run() {
    return this.action;
  }
}

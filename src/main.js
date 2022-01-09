'use strict';

export default class Main {
  constructor(action) {
    this.action = action;
  }

  packager() {}

  commands() {
    parsed_commands = new ParsedCommands();
    command = '';
  }

  real_action() {}
  need() {}
  final_command() {}
  run() { return this.action; }
}

(async() => {
    const stat = await fs.lstat(file);
    console.log(stat.isFile());
})().catch(console.error)

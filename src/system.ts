'use strict';

import commandv from './services/utils.js';

export default class System {
  name: string;

  constructor(name: string) {
    this.name = name;
  }

  executable() {
    return this.name;
  }

  location() {
    return commandv(this.name);
  }
}

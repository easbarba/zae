"use strict";

import commandv from './services/utils.js';

export default class System {
  constructor(name) {
    this.name = name;
  }

  executable() { return this.name }
  location() { return commandv(this.name) }
}

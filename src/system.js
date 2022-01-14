import commandv from './services/utils.js'

export default class System {
  name

  constructor(name) {
    this.name = name
  }

  executable() {
    return this.name
  }

  location() {
    return commandv(this.name)
  }
}

import { expect } from 'chai'

import Index from '../src/index.js'

describe('Index', function () {
  describe('main caller', () => {
    it('should have an undefined action', () => {
      const index = new Index('nodejs')

      expect(index.action).to.be.equal(undefined)
    })

    it('should get correct action', () => {
      const act = 'install'
      const index = new Index('nodejs')
      index.action = act

      expect(index.action).to.be.equal(act)
    })

    it('should get one argument', () => {
      const arg = ['mpv']
      const index = new Index(arg)

      expect(index.arguments).to.be.equal(arg)
    })

    it('should get multiple arguments', () => {
      const index = new Index(['awesome', 'zathura', 'emacs'])

      expect(index.arguments).to.include.members(['zathura', 'awesome'])
    })
  })
})

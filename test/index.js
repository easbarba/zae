import * as assert from 'assert'

import Index from '../src/index.js'

describe('Array', function() {
  describe('#indexOf()', () => {


    it('should get correct action', () => {
      const index = new Index('nodejs')
      index.action = 'install'

      assert.equal(index.action, 'install')
    })

    it('should get one argument', () => {
      const arg = ['nodejs']
      const index = new Index(arg)

      assert.equal(index.arguments, arg)
    })

    it('should get multiple arguments', () => {
      const args = ['nodejs', 'prettier']
      const index = new Index(args)

      assert.equal(index.arguments, args)
    })
  })
})

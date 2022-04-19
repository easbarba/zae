require_relative 'pak/commands'
require_relative 'pak/config'
require_relative 'pak/main'
require_relative 'pak/need'
require_relative 'pak/translate_action'
require_relative 'pak/version'

# a handy runner of distributions packages manager commands.
module Pak
  class Error < StandardError; end
end

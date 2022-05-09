require_relative 'pak/become'
require_relative 'pak/commands'
require_relative 'pak/config'
require_relative 'pak/translate'
require_relative 'pak/version'

# a handy runner of distributions packages manager commands.
module Pak
  class Error < StandardError; end
end

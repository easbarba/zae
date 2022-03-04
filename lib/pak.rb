require_relative 'pak/version'

# * Base
require_relative 'pak/commands'
require_relative 'pak/current_packager'
require_relative 'pak/main'
require_relative 'pak/need'
require_relative 'pak/parsed_commands'
require_relative 'pak/translate_action'
require_relative 'pak/utils'

module Pak
  class Error < StandardError; end
end

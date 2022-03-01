# frozen_string_literal: true

require_relative 'pak/version'

# * Services
require_relative 'pak/services/utils'

# * Base
require_relative 'pak/main'
require_relative 'pak/translate_action'
require_relative 'pak/parsed_commands'
require_relative 'pak/commands'
require_relative 'pak/current_packager'
require_relative 'pak/need'

module Pak
  class Error < StandardError; end

  # Your code goes here...
end

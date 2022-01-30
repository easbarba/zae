# frozen_string_literal: true

require_relative "distro/version"

# * Services
require_relative 'distro/services/utils'

# * Base
require_relative 'distro/main'
require_relative 'distro/translate_action'
require_relative 'distro/parsed_commands'
require_relative 'distro/commands'
require_relative 'distro/current_packager'
require_relative 'distro/need'

module Distro
  class Error < StandardError; end
  # Your code goes here...
end

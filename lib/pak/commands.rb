module Pak
  # Commands inspection
  class Commands
    attr_reader :parsed_commands

    def initialize(parsed_commands)
      @parsed_commands = parsed_commands
    end

    def all
      parsed_commands
    end

    def any?
      parsed_commands.any?
    end

    def packagers
      all.keys
    end
  end
end

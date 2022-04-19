module Pak
  # Entry point of project
  class Main
    # x
    attr_accessor :action, :arguments

    def initialize
      @action = action
    end

    def commands
      parsed_commands = ParsedCommands.new(utils).found
      commands = Commands.new parsed_commands

      exit unless commands.any?
      commands.all
    end

    def packager
      current_packager = CurrentPackager.new(commands.keys)
      current_packager.packager
    end

    def real_action
      TranslateAction.real_action commands, packager, action
    end

    def need
      Need.new action
    end

    def final_command
      result = packager, real_action
      result.append arguments
      result.prepend 'sudo' if need.admin?
      result.join ' '
    end

    def run
      system final_command
    end

    public :run
  end
end

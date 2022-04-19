module Pak
  # Entry point of project
  class Main
    # current action to be run
    attr_accessor :action

    # optional arguments given
    attr_accessor :arguments

    def initialize
      @action = action
    end

    # returns found packager
    def packager
      config = Config.new
      config.found
    end

    # get all commands
    def commands
      commands = Commands.new packager
      commands.all
    end

    # translate to real action
    def real_action
      action = TranslateAction.new(commands, action)
      action.translated
    end

    # does action needs to become super user
    def become
      Become.new action
    end

    # deliver final command
    def final_command
      result = packager, real_action
      result.append arguments
      result.prepend become.found if become.need?
      result.join ' '
    end

    # just go
    def run
      system final_command
    end
  end
end

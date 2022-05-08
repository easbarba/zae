module Pak
  # Entry point of project
  class Main
    # choosed action
    attr_accessor :action

    # optional arguments
    attr_accessor :arguments

    def commands
      Commands.new
    end

    def real_action
      @action
      # commands.install
    end

    # check if action requires super user to run
    def become
      Become.new action
    end

    # deliver final command
    def final_command
      x = [].tap do |x|
        x << real_action
        x << arguments
      end

      x.prepend become.exec if become.need?
      x.join ' '
    end

    # just go
    def run
      p final_command
      # system final_command
    end
  end
end

module Pak
  # define how command should be run, either to become super user or not.
  class Become
    def initialize(action)
      @action = action
    end

    def need?
      become = Commands.new.become
      become.include? @action
    end

    # query which become methods are available on user system
    def exec
      'sudo'
    end
  end
end

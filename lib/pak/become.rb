# frozen_string_literal: true

require 'pathname'

module Pak
  # define how command should be run, either to become super user or not.
  class Become
    SUDO = Pathname.new('/usr/bin/sudo')

    def initialize(condition)
      @condition = condition
    end

    def need?
      @condition
    end

    # query which become methods are available on user system
    def exec
      SUDO if SUDO.exist? # TODO: check for become executable
    end
  end
end

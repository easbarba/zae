# frozen_string_literal: true

require 'pathname'

module Pak
  # define how command should be run, either to become super user or not.
  class Become
    attr_accessor

    SUDO_PATH = Pathname.new('/usr/bin/sudo')
    DOAS_PATH = Pathname.new('/usr/bin/doas')

    def initialize(action, config)
      @action = action
      @config = config
    end

    def need?
      return false if @config[:become].nil?

      if @config[:become].key?(@action)
        true
      else
        false
      end
    end

    # query which become methods are available on user system
    def exec
      if SUDO_PATH.exist?
        SUDO_PATH
      elsif DOAS_PATH.exist?
        DOAS_PATH
      else
        'unknown'
      end
    end
  end
end

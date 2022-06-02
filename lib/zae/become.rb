# frozen_string_literal: true

require 'pathname'

module Zae
  # define how command should be run, either to become super user or not.
  class Become
    BECOMERS = [Pathname.new('/usr/bin/sudo'), Pathname.new('/usr/bin/doas')].freeze

    def initialize(action, config)
      @action = action
      @config = config
    end

    def need?
      return false if @config[:become].nil?

      @config[:become].key?(@action)
    end

    # query which become methods are available on user system
    def exec
      BECOMERS.first { |exe| return exe if exe.exist? }
    end
  end
end

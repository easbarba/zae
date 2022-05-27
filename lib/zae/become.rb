# frozen_string_literal: true

require 'pathname'

module Zae
  # define how command should be run, either to become super user or not.
  class Become
    attr_accessor
    BECOMERS = [Pathname.new('/usr/bin/sudo'), Pathname.new('/usr/bin/doas')].freeze

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
      BECOMERS.each do |b|
        return b if b.exist?
      end
    end
  end
end

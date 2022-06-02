# frozen_string_literal: true

module Zae
  # translate action to final command
  class Translate
    def initialize(action, args = [],
                   config = Config.new.found,
                   become = Become.new(action, config))
      @args = args
      @action = action
      @config = config
      @become = become
    end

    # simple string representation
    def to_s
      cmd = @become.need? ? @config[:become][@action] : @config[:user][@action]
      query cmd
    end

    private

    # query for final command composition
    def query(action)
      # TODO: raise 'command was not provided' and return if command.nil?
      executable = @config[:exec]

      [].tap do |el|
        el << @become.exec if @become.need?
        el << executable
        el << action
      end
        .+(@args)
        .join(' ')
    end
  end
end

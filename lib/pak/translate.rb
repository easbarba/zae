# frozen_string_literal: true

module Pak
  # - TODO list each or all command(s) available,
  # - TODO returns null if none command is set,
  # - TODO may default to cli given command.
  # translate action to final command
  class Translate
    # final translation of commands
    attr_reader :run

    def initialize(action, args = [], config = Config.new.found,
                   become: Become.new(action, config))
      @args = args
      @action = action

      @config = config
      @become = become
    end

    def to_str
      cmd = if @become.need?
              @config[:become][@action]
            else
              @config[:user][@action]
            end

      command cmd
    end

    private

    # TODO: raise 'command was not provided' and return if command.nil?
    # query for final command composition
    def command(action)
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

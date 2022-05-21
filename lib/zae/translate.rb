# frozen_string_literal: true

module Zae
  # translate action to final command
  class Translate
    def initialize(action, args = [], config = Config.new.found,
                   become: Become.new(action, config))
      @args = args
      @action = action

      @config = config
      @become = become
    end

    def to_s
      cmd = @become.need? ? @config[:become][@action] : @config[:user][@action]
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

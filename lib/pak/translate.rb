# frozen_string_literal: true

module Pak
  # - TODO list each or all command(s) available,
  # - TODO returns null if none command is set,
  # - TODO may default to cli given command.
  # translate action to final command
  class Translate
    # raw represetation of packager info and commands.
    attr_reader :config

    # final translation of commands
    attr_reader :real

    def initialize(action, args = [])
      @args = args
      @action = action

      @config = Config.new.found

      @become = final_become
      @real = final_real
    end

    private

    def final_become
      if @config[:become].nil?
        Become.new false
      else
        Become.new @config[:become].key?(@action)
      end
    end

    def final_real
      cmd = if @become.need?
              @config[:become][@action]
            else
              @config[:user][@action]
            end

      command cmd
    end

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
        .yield_self(&->(cmd) { system cmd })
    end
  end
end

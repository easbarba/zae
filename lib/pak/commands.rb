module Pak
  # Feature requirement:
  # - TODO list each or all command(s) available,
  # - TODO returns null if none command is set,
  # - TODO may default to cli given command.
  class Commands
    # all commands that can be only run as become administrative user.
    attr_reader :become

    # all commands that can be run as user,
    attr_reader :user

    def initialize
      # raw represetation of packager info and commands.
      @config = Config.new.parsed
      @become = @config[:become].keys.dup.freeze
      @user = @config[:user].keys.dup.freeze
    end

    # update repository database
    def update
      get_command :update
    end

    # upgrade system package(s)
    def upgrade
      get_command :upgrade
    end

    def deps
      get_command :deps
    end

    def autoremove
      get_command :autoremove
    end

    def depends
      get_command :depends
    end

    def install
      get_command :install
    end

    def remove
      get_command :remove
    end

    def download
      get_command :download
    end

    def fix
      get_command :fix
    end

    # search for given package
    def search
      get_command :search
    end

    # provide user with manual information
    def help
      get_command :help
    end

    # show package information
    def show
      get_command :show
    end

    def info
      get_command :info
    end

    # packager current version
    def version
      get_command :version
    end

    def to_str; end

    private

    # check if command is available in either become or user, else returns a raw string of it.
    def get_command(command)
      raise 'command was not provided' and return if command.nil?

      return @config[:become][command] if @config[:become].key?(command)
      return @config[:user][command] if @config[:user].key?(command)
    end

    def all
      @config.slice :become, :user
    end

    def any?
      @config.any?
    end
  end
end

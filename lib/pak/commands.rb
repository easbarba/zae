module Pak
  # Feature requirement:
  # - TODO list each or all command(s) available,
  # - TODO returns null if none command is set,
  # - TODO may default to cli given command.
  class Commands
    # raw represetation of packager info and commands.
    attr_reader :packager

    # all commands that can be only run as become administrative user.
    attr_accessor :become

    # all commands that can be run as user,
    attr_accessor :user

    def initialize(packager)
      @packager = packager
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

      if @packager[:become].key? command
        @packager[:become][command]
        @become += command
      end

      if @packager[:user].key? command
        @packager[:user][command]
        @user += command
      end
    end

    def all
      @packager.slice :become, :user
    end

    def any?
      @packager.any?
    end
  end
end

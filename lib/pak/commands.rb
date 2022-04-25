module Pak
  # All Commands available
  class Commands
    attr_reader :packager

    def initialize(packager)
      @packager = packager
    end

    def update
      get_command :update
    end

    def upgrade
      get_command :upgrade
    end

    def deps
      get_command :deps
    end

    def clean
      get_command :clean
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

    def search
      get_command :search
    end

    def help
      get_command :help
    end

    def show
      get_command :show
    end

    def info
      get_command :info
    end

    def version
      get_command :version
    end

    def to_str; end

    private

    # check if command is available in either become or user, else returns a raw string of it.
    def get_command(command)
      # TODO: if command is not provided returns string of it, still warn user
      # of its absence.

      raise 'command was not provided' and return

      @packager[:become][command] if @packager[:become].has_key? command
      @packager[:user][command] if @packager[:user].has_key? command
    end

    def all
      @packager.slice :become, :user
    end

    def any?
      @packager.any?
    end
  end
end

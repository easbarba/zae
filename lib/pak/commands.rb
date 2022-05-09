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

    # raw represetation of packager info and commands.
    attr_reader :config

    def initialize
      @config = Config.new.parsed
      @executable = @config[:exec]
    end

    # update repository database
    def update
      translate(:update).call
    end

    # upgrade system package(s)
    def upgrade
      translate(:upgrade).call
    end

    def deps
      translate(:deps).call
    end

    def autoremove(args)
      translate(:autoremove).call args
    end

    def depends
      translate(:depends).call
    end

    def install(args)
      translate(:install).call args
    end

    def installed(arg)
      translate(:installed).call arg
    end

    def remove(args)
      translate(:remove).call args
    end

    def download(args)
      translate(:download).call args
    end

    def fix(args)
      translate(:fix).call args
    end

    # search for given package
    def search(arg)
      translate(:search).call arg
    end

    # provide user with manual information
    def help
      translate(:help).call
    end

    # show package information
    def show
      translate(:show).call
    end

    def info(args)
      translate(:info).call args
    end

    # packager current version
    def version
      translate(:version).call
    end

    private

    # query for final command composition
    def translate(command)
      raise 'command was not provided' and return if command.nil?

      run = ->(cmd) { system cmd }
      lambda do |arg|
        [].tap do |el|
          become = @config[:become].key? command

          el << 'sudo' if become # TODO: check for become executable
          el << @executable
          el << (become ? @config[:become][command] : @config[:user][command])
        end
          .+(arg)
          .join(' ')
          .yield_self(&run)
      end
    end

    def all
      @config.slice :become, :user
    end

    def any?
      @config.any?
    end

    def to_str; end
  end
end

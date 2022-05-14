# frozen_string_literal: true

module Pak
  # Feature requirement:
  class Commands
    # update repository database
    def update
      exec :update
    end

    # upgrade system package(s)
    def upgrade
      exec :upgrade
    end

    def deps
      exec :deps
    end

    def autoremove(...)
      exec(:autoremove, ...)
    end

    def depends
      exec :depends
    end

    def install(...)
      exec(:install, ...)
    end

    def installed(...)
      exec(:installed, ...)
    end

    def remove(...)
      exec(:remove, ...)
    end

    def download(...)
      exec(:download, ...)
    end

    def fix(...)
      exec(:fix, ...)
    end

    # search for given package
    def search(...)
      exec(:search, ...)
    end

    # provide user with manual information
    def help
      exec :help
    end

    # show package information
    def show
      exec :show
    end

    def info(...)
      exec(:info, ...)
    end

    # packager current version
    def version
      exec :version
    end

    private

    def exec(...)
      print_run = lambda { |cmd|
        puts "command: #{cmd}"
        system cmd
      }

      Translate.new(...)
               .to_str
               .yield_self(&print_run)
    end
  end
end

# frozen_string_literal: true

module Pak
  # Feature requirement:
  class Commands
    # update repository database
    def update
      Translate.new(:update).run
    end

    # upgrade system package(s)
    def upgrade
      Translate.new(:upgrade).run
    end

    def deps
      Translate.new(:deps).run
    end

    def autoremove(...)
      Translate.new(:autoremove, ...).run
    end

    def depends
      Translate.new(:depends).run
    end

    def install(...)
      Translate.new(:install, ...).run
    end

    def installed(...)
      Translate.new(:installed, ...).run
    end

    def remove(...)
      Translate.new(:remove, ...).run
    end

    def download(...)
      Translate.new(:download, ...).run
    end

    def fix(...)
      Translate.new(:fix, ...).run
    end

    # search for given package
    def search(...)
      Translate.new(:search, ...).run
    end

    # provide user with manual information
    def help
      Translate.new(:help).run
    end

    # show package information
    def show
      Translate.new(:show).run
    end

    def info(...)
      Translate.new(:info, ...).run
    end

    # packager current version
    def version
      Translate.new(:version).run
    end
  end
end

# frozen_string_literal: true

module Pak
  # Feature requirement:
  class Commands
    # update repository database
    def update
      Translate.new(:update).real
    end

    # upgrade system package(s)
    def upgrade
      Translate.new(:upgrade).real
    end

    def deps
      Translate.new(:deps).real
    end

    def autoremove(...)
      Translate.new(:autoremove, ...).real
    end

    def depends
      Translate.new(:depends).real
    end

    def install(...)
      Translate.new(:install, ...).real
    end

    def installed(...)
      Translate.new(:installed, ...).real
    end

    def remove(...)
      Translate.new(:remove, ...).real
    end

    def download(...)
      Translate.new(:download, ...).real
    end

    def fix(...)
      Translate.new(:fix, ...).real
    end

    # search for given package
    def search(...)
      Translate.new(:search, ...).real
    end

    # provide user with manual information
    def help
      Translate.new(:help).real
    end

    # show package information
    def show
      Translate.new(:show).real
    end

    def info(...)
      Translate.new(:info, ...).real
    end

    # packager current version
    def version
      Translate.new(:version).real
    end
  end
end

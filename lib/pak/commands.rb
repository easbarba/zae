# frozen_string_literal: true

module Pak
  # Feature requirement:
  class Commands
    # update repository database
    def update
      run :update
    end

    # upgrade system package(s)
    def upgrade
      run :upgrade
    end

    def deps
      run :deps
    end

    def autoremove(...)
      run(:autoremove, ...)
    end

    def depends
      run :depends
    end

    def install(...)
      run(:install, ...)
    end

    def installed(...)
      run(:installed, ...)
    end

    def remove(...)
      run(:remove, ...)
    end

    def download(...)
      run(:download, ...)
    end

    def fix(...)
      run(:fix, ...)
    end

    # search for given package
    def search(...)
      run(:search, ...)
    end

    # provide user with manual information
    def help
      run :help
    end

    # show package information
    def show
      run :show
    end

    def info(...)
      run(:info, ...)
    end

    # packager current version
    def version
      run :version
    end

    private

    def run(...)
      Translate.new(...)
               .to_str
               .yield_self(&->(cmd) { system cmd })
    end
  end
end

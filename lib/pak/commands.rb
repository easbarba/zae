module Pak
  # All Commands available
  class Commands
    attr_reader :packager

    def initialize(packager)
      @packager = packager
    end

    def all
      @packager.slice :become, :user
    end

    def become
      @packager[:become]
    end

    def user
      @packager[:user]
    end

    def any?
      @packager.any?
    end
  end
end

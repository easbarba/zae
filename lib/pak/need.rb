module Pak
  # define how command should be run, either to become super user or not.
  class Become
    def initialize(packager)
      @packager = packager
    end

    # commands
    # BECOME = @packager[:become].keys.dup.freeze

    # non-become commands
    # USER = @packager[:user].keys.dup.freeze

    # query which become methods are available on user system
    def becomer; end
  end
end

module Pak
  # define how command should be run, either to become super user or not.
  class Need
    # commands
    BECOME = @packager[:become].keys.dup.freez

    # non-become commands
    USER = @packager[:user].keys.dup.freeze

    # query which become methods are available on user system
    def becomer; end
  end
end

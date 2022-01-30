# frozen_string_literal: true

module Cejo
  module Distro
    # CurrentPackager x
    class CurrentPackager
      attr_reader :utils, :keys

      def initialize(utils, keys)
        @utils = utils
        @keys = keys
      end

      def packager
        keys.find { |exec| utils.which? exec }.to_sym
      end
    end
  end
end

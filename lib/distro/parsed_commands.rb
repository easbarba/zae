# frozen_string_literal: true

# TODO: only parse found executable commands

module Cejo
  module Distro
    # Objectfy commands parsed
    class ParsedCommands
      attr_reader :utils, :folder

      def initialize(utils)
        @utils = utils
        @folder = Pathname.new(File.join(Dir.home, '.config', 'distro'))
      end

      def found
        utils.parse_folder folder
      end

      def any?
        packagers.any?
      end
    end
  end
end

# frozen_string_literal: true

module Zae
  # All Commands available
  class Commands
    def initialize
      Commands.create_commands
    end

    ACTIONS = %i[update upgrade deps autoremove depends install installed remove
                 fix search help show info version].freeze

    def self.create_commands
      ACTIONS.each do |name|
        define_method name do |args = []|
          Commands.exec name, args
        end
      end
    end

    PRINT_RUN = lambda do |cmd|
      puts "command: #{cmd}"
      system cmd
    end

    def self.exec(...)
      Translate.new(...)
               .to_s
               .then(&PRINT_RUN)
    end
  end
end

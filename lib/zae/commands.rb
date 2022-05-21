# frozen_string_literal: true

module Zae
  # All Commands available
  class Commands
    ACTIONS = %i[update upgrade deps autoremove depends install installed remove
                 fix search help show info version]

    def self.create_commands
      ACTIONS.each do |name|
        define_method name do |args = []|
          Commands.exec name, args
        end
      end
    end

    def self.exec(...)
      print_run = lambda { |cmd|
        puts "command: #{cmd}"
        system cmd
      }

      Translate.new(...)
               .to_s
               .yield_self(&print_run)
    end

    def initialize
      Commands.create_commands
    end
  end
end

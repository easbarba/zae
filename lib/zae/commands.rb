# frozen_string_literal: true

module Zae
  # Feature requirement:
  class Commands
    ACTIONS = %i[update upgrade deps autoremove depends install installed remove
                 fix search help show info version].freeze

    ACTIONS.each do |name|
      define_method name do |args = []|
        exec name, args
      end
    end

    private

    def exec(...)
      print_run = lambda { |cmd|
        puts "command: #{cmd}"
        system cmd
      }

      Translate.new(...)
               .to_str
               .yield_self(&print_run)
    end
  end
end

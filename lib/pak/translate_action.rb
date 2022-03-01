# frozen_string_literal: true

module Pak
  # Translate generic action into system real action
  class TranslateAction
    # a real action
    def self.real_action(commands, packager, action)
      commands[packager][action]
    end
  end
end

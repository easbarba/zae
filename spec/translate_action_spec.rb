# frozen_string_literal: true

require 'distro'

require 'spec_helper'

module Distro
  RSpec.describe 'Distro' do
    context 'Translate Action' do
      let(:action) { Cejo::Distro::TranslateAction }

      it 'has the real action' do
        commands = {
          apt: { autoremove: 'autoremove' },
          dnf: { autoremove: 'autoremove' },
        }

        real_action = action.real_action(commands, :dnf, :autoremove)
        expect(real_action).to eq('autoremove')
      end
    end
  end
end

# frozen_string_literal: true

require 'distro'

require 'spec_helper'

module Distro
  RSpec.describe 'Distro' do
    context 'What about the Commands?' do
      let(:raw_command) { { dnf: { autoremove: 'autoremove' } } }

      it 'has, at least, one packager commands set!' do
        commands = Cejo::Distro::Commands.new(raw_command)
        expect(commands.any?).to eq(raw_command.any?)
      end

      it 'gets all of package, just right!' do
        raw_commands = raw_command.merge({ apt: { autoremove: 'autoremove' } })
        commands = Cejo::Distro::Commands.new(raw_commands)
        expect(commands.packagers).to eq(%i[dnf apt])
      end
    end
  end
end

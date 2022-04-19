require 'spec_helper'

module Pak
  RSpec.describe 'Pak' do
    context 'Configuration' do
      it 'has, at least, one configuration file' do
        cmd = Pak::Config.new

        expect(cmd.projects.any?).to eq true
      end

      it 'has found an available executable' do
        cmd = Pak::Config.new

        expect(cmd.executable).to eq :apt
      end

      it 'has a loaded configuration' do
        cmd = Pak::Config.new

        expect(cmd.found.any?).to eq(true)
      end

      # it 'has, at least, one packager commands set!' do
      #   commands = Pak::Commands.new(raw_command)

      #   expect(commands.any?).to eq(raw_command.any?)
      # end

      # it 'gets all of package, just right!' do
      #   raw_commands = raw_command.merge({ apt: { autoremove: 'autoremove' } })
      #   commands = Pak::Commands.new(raw_commands)

      #   expect(commands.packagers).to eq(%i[dnf apt])
      # end
    end
  end
end

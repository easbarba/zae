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
    end
  end
end

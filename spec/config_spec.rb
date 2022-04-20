require 'spec_helper'

module Pak
  RSpec.describe 'Pak' do
    context 'Configuration' do
      let(:config) { Pak::Config.new }

      it 'has, at least, one configuration file' do
        expect(config.all.any?).to eq true
      end

      it 'has found an available executable' do
        expect(config.executable).to eq :apt
      end

      it 'has a loaded configuration' do
        expect(config.found[:become].any?).to eq(true)
      end

      # it 'has already discovered current package manager' do
      #   expect(config.discovered?).to eq true
      # end

      # it 'gets all of package, just right!' do
      #   expect(config.packagers).to eq(%i[dnf apt])
      # end
    end
  end
end

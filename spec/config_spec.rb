require 'spec_helper'

require 'pak'

module Pak
  RSpec.describe Config, 'All about configuration' do
    subject(:config) { Pak::Config.new }

    context '#folder' do
      it 'has, at least, one file' do
        expect(config.any?).to eq true
      end
    end

    context 'loaded' do
      it 'has set an executable' do
        expect(config.executable).to eq :apt
      end

      it 'has become and user commands' do
        expect(config.packager[:become][:install]).to eq('install')
        expect(config.packager[:user][:search]).to eq('search')
      end

      it 'has same command in both become and user' do
        expect(config.packager[:become][:install]).to eq('install')
        expect(config.packager[:user][:search]).to eq('search')
      end
    end

    # it 'has already discovered current package manager' do
    #   expect(config.discovered?).to eq true
    # end

    # it 'gets all of package, just right!' do
    #   expect(config.packagers).to eq(%i[dnf apt])
    # end
  end
end

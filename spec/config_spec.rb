# frozen_string_literal: true

require 'spec_helper'

require 'zae'

module Zae
  RSpec.describe Config, 'All about configuration' do
    subject(:config) { Config.new }

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
        expect(config.found[:become][:install]).to eq('install')
        expect(config.found[:user][:search]).to eq('search')
      end

      it 'has same command in both become and user' do
        expect(config.found[:become][:install]).to eq('install')
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

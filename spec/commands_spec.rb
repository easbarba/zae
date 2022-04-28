require 'spec_helper'

module Pak
  RSpec.describe 'Pak' do
    context 'commands' do
      let(:raw_commands) do
        Song = Struct.new(:exec, :become, :user)
        Song.new(
          :apt,
          { builddep: 'build-dep', clean: 'autoremove', deps:
            'build-dep', download: 'download', fix: 'install -f',
            install: 'install', remove: 'remove',
            sysupgrade: 'dist-upgrade', update: 'update',
            upgrade: 'upgrade' },
          { depends: 'depends', help: 'help', info: 'show',
            installed: 'list --installed', search: 'search',
            version: 'version' }
        )
      end

      # it 'has all of them' do
      #   commands = Pak::Commands.new(Config.new.found)

      #   expect(commands.all).to eq(raw_commands)
      # end
    end
  end
end

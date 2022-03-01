# frozen_string_literal: true

require 'pak'

require 'spec_helper'

module Pak
  RSpec.describe 'Pak' do
    context 'main caller' do
      let(:main) { Pak::Main.new(utils) }
      let(:arguments) { 'fonts-hack' }

      let(:utils) {
        Class.new do
          def which?(x)
            true
          end

          def parse_folder(x)
            { apt: { install: 'install' } }
          end
        end.new
      }

      it 'has action argument as symbol' do
        main.action = :search
        main.arguments = 'fonts-hack'
        expect(main.action).to eq(:search)
      end

      it 'has string arguments' do
        main.action = :install
        main.arguments = arguments
        expect(main.arguments).to eq(arguments)
      end

      it 'has does not have arguments' do
        main.action = :update
        main.arguments = nil
        expect(main.arguments).to eq(nil)
      end

      it 'has the translated action' do
        main.action = :install
        main.arguments = arguments
        expect(main.real_action).to eq('install')
      end

      it 'has the commands' do
        main.action = :install
        main.arguments = arguments
        expect(main.commands).to eq(main.utils.parse_folder(''))
      end

      it 'use the correct pakager' do
        main.action = :install
        main.arguments = arguments
        expect(main.packager).to eq(:apt)
      end

      it 'has the final_command' do
        main.action = :install
        main.arguments = arguments
        expect(main.final_command).to eq('sudo apt install fonts-hack')
      end
    end
  end
end

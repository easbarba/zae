# frozen_string_literal: true

require 'spec_helper'

require 'zae'

module Zae
  RSpec.describe Become do
    let(:config) do
      {
        exec: '/usr/bin/binx',
        become: { remove: 'uninstall' },
        user: { search: 'query -f' }
      }
    end

    context '#need?' do
      it 'run command as superuser' do
        become = Become.new :remove, config
        expect(become.need?).to eq true
      end

      it 'run command as user' do
        become = Become.new :search, config
        expect(become.need?).to eq false
      end
    end
  end
end

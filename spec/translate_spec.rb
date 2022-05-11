require 'spec_helper'
require 'ostruct'

require 'pak'

module Pak
  RSpec.describe Translate do
    let(:config) do
      { exec: '/usr/bin/binx',
        become: { remove: 'uninstall' },
        user: { search: 'query -f' } }
    end

    context '#to_str' do
      it 'search' do
        become = OpenStruct.new(need?: false, exec: '')

        trans = Translate.new :search, %w[stumpwm], config,
                              become: become

        expect(trans.to_str).to eq('/usr/bin/binx query -f stumpwm')
      end

      it 'remove' do
        become = OpenStruct.new(need?: true, exec: '/usr/bin/gimme')
        trans = Translate.new :remove, %w[stumpwm git], config, become: become

        expect(trans.to_str).to eq('/usr/bin/gimme /usr/bin/binx uninstall stumpwm git')
      end
    end
  end
end

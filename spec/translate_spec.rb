# frozen_string_literal: true

require 'spec_helper'

require 'ostruct'

require 'zae'

module Zae
  RSpec.describe Translate do
    let(:config) do
      {
        exec: '/usr/bin/binx',
        become: { remove: 'uninstall' },
        user: { search: 'query -f' }
      }
    end

    context '#to_s' do
      it 'issue user permission command for search package' do
        become = OpenStruct.new(need?: false, exec: '')
        trans = Translate.new(:search, %w[stumpwm], config, become)

        expect(trans.to_s).to eq('/usr/bin/binx query -f stumpwm')
      end

      it 'issue superuser permission command for remove package' do
        become = OpenStruct.new(need?: true, exec: '/usr/bin/gimme')
        trans = Translate.new(:remove, %w[stumpwm git], config, become)

        expect(trans.to_s).to eq('/usr/bin/gimme /usr/bin/binx uninstall stumpwm git')
      end

      pending 'returns null if none command is set'
      pending 'may default to cli given command.'
    end
  end
end

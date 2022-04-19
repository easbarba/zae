require 'spec_helper'

module Pak
  RSpec.describe 'Pak' do
    context 'Configuration' do
      let(:raw_cmd) { { dnf: { autoremove: 'autoremove' } } }

      it 'has, at least, one packager commands set!' do
        cmd = Pak::Commands.new(raw_cmd)
        expect(cmd.packagers.any?).to eq(raw_cmd.any?)
      end
    end
  end
end

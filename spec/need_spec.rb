# frozen_string_literal: true

require 'pak'

require 'spec_helper'

module Pak
  RSpec.describe 'Pak' do
    context 'Need' do
      it 'needs to be admin' do
        need = Pak::Need.new(:install)
        expect(need.admin?).to eq(true)
      end

      it 'needs arguments' do
        need = Pak::Need.new(:install)
        expect(need.arguments?).to eq(true)
      end

      it 'accepts whatever you wish, arguments or no' do
        need = Pak::Need.new(:autoremove)
        expect(need.whatever?).to eq(true)
      end
    end
  end
end

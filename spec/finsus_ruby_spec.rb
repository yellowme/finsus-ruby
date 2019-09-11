require 'spec_helper'

describe Finsus do
  describe '#config' do
    it 'sets the username initializer style' do
      Finsus.config do |c|
        c.username = 'abc'
      end

      expect(Finsus.username).to eq('abc')
    end
  end
end

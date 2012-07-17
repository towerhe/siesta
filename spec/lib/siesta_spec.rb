require 'spec_helper'

describe Siesta do
  describe '.configure' do
    before do
      Siesta.configure do |config|
        config.spec_dir = 'spec/javascripts'
      end
    end

    it 'sets spec dir' do
      expect(Siesta.config.spec_dir).to be_eql('spec/javascripts')
    end
  end
end

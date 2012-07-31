require 'spec_helper'

describe Siesta do
  describe '.configure' do
    context 'when setting spec_javascripts' do
      before do
        Siesta.configure do |config|
          config.spec_dir = 'test/javascripts'
        end
      end

      after do
        Siesta.configure do |config|
          config.spec_dir = 'spec/javascripts'
        end
      end

      it 'sets spec_dir' do
        expect(Siesta.config.spec_dir).to be_eql('test/javascripts')
      end
    end

    context 'when nothing set' do
      before do
        Siesta.configure do |config|
        end
      end

      it 'sets spec_dir to "spec/javascripts"' do
        Siesta.config.spec_dir.should == 'spec/javascripts' 
      end

      it 'sets auto_organizing to "true"' do
        Siesta.config.auto_organizing.should be_true
      end
    end
  end
end

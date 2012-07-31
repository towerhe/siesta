require 'rails'
require 'virtus'

require 'siesta/engine'
require 'siesta/test_suite'

module Siesta
  class << self
    def config
      @config ||= ActiveSupport::OrderedOptions.new
    end

    def configure
      config.spec_dir = 'spec/javascripts'
      config.auto_organizing = true

      yield config
    end
  end
end

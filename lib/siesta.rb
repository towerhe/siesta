require "siesta/engine"

module Siesta
  class << self
    def config
      @config ||= ActiveSupport::OrderedOptions.new
    end

    def configure
      yield config
    end
  end
end

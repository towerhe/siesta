require_dependency "siesta/application_controller"

module Siesta
  class SiestaController < ApplicationController
    def index
      render :layout => nil
    end
  end
end

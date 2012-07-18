module Siesta
  module ApplicationHelper
    def include_siesta_config
      if Rails.application.assets.find_asset('siesta_config.js')
        javascript_include_tag 'siesta_config'
      else
        javascript_include_tag 'siesta/siesta_config'
      end
    end
  end
end

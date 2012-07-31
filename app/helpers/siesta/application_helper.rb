module Siesta
  module ApplicationHelper
    def include_siesta_config
      if asset_exists?('siesta_config.js')
        javascript_include_tag 'siesta_config'
      else
        javascript_include_tag 'siesta/siesta_config'
      end
    end

    def include_test_harness
      if Siesta.config.auto_organizing
        content_tag(:script, test_harness, { type: 'text/javascript' }, false)
      else
        javascript_include_tag 'test_harness'
      end
    end

    private
    def asset_exists?(asset)
      Rails.application.assets.find_asset(asset)
    end

    def test_harness
      @suite ||= TestSuite.new(File.join(Rails.root, Siesta.config.spec_dir))

      groups = @suite.groups.inject([]) do |c, g|
        c << { group: g.name, items: g.items.map(&:url) }
      end

      <<-SCRIPTS
var Harness = Siesta.Harness.Browser.ExtJS;

Harness.start(#{groups.to_json.gsub(/^\[|\]$/, '')});
      SCRIPTS
    end
  end
end

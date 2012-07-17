module Siesta
  class Engine < ::Rails::Engine
    isolate_namespace Siesta

    initializer "siesta.environment" do |app|
      unless app.config.assets.enabled
        raise RuntimeError, "siesta requires the asset pipeline to be enabled"
      end

      app.config.assets.paths << app.root.join(Siesta.config.spec_dir || 'spec/javascripts').to_s
    end
  end
end

$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "siesta/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "siesta"
  s.version     = Siesta::VERSION
  s.authors     = ["Tower He"]
  s.email       = ["towerhe@gmail.com"]
  s.homepage    = "https://github.com/towerhe/siesta"
  s.summary     = "A rails mountable engine setting up siesta for testing ExtJS"
  s.description = "A rails mountable engine setting up siesta for testing ExtJS"

  s.files = Dir["{app,config,db,lib,vendor}/**/*"] + ["LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 3.2.6"
end

$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mongoid_address_models/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mongoid_address_models"
  s.version     = MongoidAddressModels::VERSION
  s.authors     = ["Stuart Harrison"]
  s.email       = ["tech@openaddressesuk.org"]
  s.homepage    = "http://openaddressesuk.org"
  s.summary     = "Shared address models for theodolite and distiller"
  s.description = "Shared address models for theodolite and distiller"
  s.license     = "MIT"

  s.files = `git ls-files`.split($\)
  s.require_paths = ["lib", "app"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.1.7"
  s.add_dependency "mongoid"
  s.add_dependency "mongoid_token"
  s.add_dependency "mongoid_geospatial"
  s.add_dependency "database_cleaner"
  s.add_dependency "factory_girl"
  s.add_dependency "stringex"

  s.add_development_dependency "rspec"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "pry"
  s.add_development_dependency "factory_girl"
end

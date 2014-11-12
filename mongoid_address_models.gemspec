$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "mongoid_address_models/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "mongoid_address_models"
  s.version     = MongoidAddressModels::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of MongoidAddressModels."
  s.description = "TODO: Description of MongoidAddressModels."
  s.license     = "MIT"

  s.files = `git ls-files`.split($\)
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

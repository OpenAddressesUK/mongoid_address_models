# Require this file in a non-Rails app to load all the things
require 'mongoid'
require 'mongoid_token'
require 'mongoid_geospatial'
require 'stringex'

root_path = "#{File.dirname(__FILE__)}/../.."
%w[ app/models lib ].each do |path|
  full_path = File.expand_path("#{root_path}/#{path}")
  $LOAD_PATH.unshift full_path unless $LOAD_PATH.include?(full_path)
end

Dir.glob("#{root_path}/app/**/*.rb").each {|f| require f }

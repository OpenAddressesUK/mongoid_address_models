require 'mongoid'
require 'mongoid_token'
require 'mongoid_geospatial'

module MongoidAddressModels
end

require 'mongoid_address_models/mongoid_point_patch'
require 'mongoid_address_models/engine' if defined?(Rails)

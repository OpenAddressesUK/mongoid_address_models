require 'mongoid'
require 'mongoid_token'
require 'mongoid_geospatial'

begin
  module MongoidAddressModels
    class Engine < ::Rails::Engine
      isolate_namespace MongoidAddressModels
    end
  end
rescue NameError
  module MongoidAddressModels
  end
end

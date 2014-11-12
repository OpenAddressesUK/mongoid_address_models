require "mongoid"

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

module MongoidAddressModels
  class Engine < ::Rails::Engine

    initializer 'mongoid_address_models.autoload', :before => :set_autoload_paths do |app|
      Mongoid::Elasticsearch.autocreate_indexes = false
      model_path = File.expand_path("../../../app/models", __FILE__)
      app.config.eager_load_paths << model_path
    end
  end
end

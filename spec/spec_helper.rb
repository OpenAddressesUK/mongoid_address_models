require 'factory_girl'
require 'database_cleaner'
require 'pry'

require 'mongoid_address_models/require_all'

Mongoid.load!(File.join(File.dirname(__FILE__), "..", "config", "mongoid.yml"), :test)

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  FactoryGirl.definition_file_paths = %w(lib/mongoid_address_models/factories)
  FactoryGirl.find_definitions
  I18n.enforce_available_locales = false

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  I18n.enforce_available_locales = false

  config.before(:each) do
    DatabaseCleaner.start
    Street.create_indexes
    Postcode.create_indexes
    Locality.create_indexes
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end

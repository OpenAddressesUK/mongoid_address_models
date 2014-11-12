require 'factory_girl'
require 'database_cleaner'

require 'mongoid_address_models/require_all'

Mongoid.load!(File.join(File.dirname(__FILE__), "..", "config", "mongoid.yml"), :test)

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  FactoryGirl.find_definitions

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end

require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
  
  RSpec.configure do |config|
    # config.fixture_path = "#{::Rails.root}/spec/factories"

    config.use_transactional_fixtures = true

    config.infer_base_class_for_anonymous_controllers = false

    # config.order = "random"

    # Clean up Carrierwave test uploads
    config.after(:all) do
      if Rails.env.test? 
        FileUtils.rm_rf(Dir["#{Rails.root}/spec/support/uploads"])
      end 
    end
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.

end

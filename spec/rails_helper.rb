ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!

  config.before(:suite) do
    DatabaseRewinder.strategy = :truncation
  end

  config.before(:each) do
    DatabaseRewinder.clean_all
    load "#{Rails.root}/db/seeds.rb"
  end

  config.after(:each) do
    DatabaseRewinder.clean
  end

  config.include FactoryGirl::Syntax::Methods
  Faker::Config.locale = :en
end

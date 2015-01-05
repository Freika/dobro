ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'capybara/rails'
require 'capybara/poltergeist'
require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
Capybara.javascript_driver = :poltergeist

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.include Capybara::DSL
  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
  config.include FactoryGirl::Syntax::Methods
end

def sign_in_with(username, password)
  visit root_path
  click_link 'Войти'
  fill_in 'Имя пользователя', with: username
  fill_in 'Пароль', with: password

  click_button 'Войти'
end

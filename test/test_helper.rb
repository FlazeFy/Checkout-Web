ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require 'capybara/rails'
require 'selenium/webdriver'

Capybara.register_driver :selenium_firefox do |app|
  options = Selenium::WebDriver::Firefox::Options.new
  options.binary = '/path/to/firefox/binary'  # Specify the path to your Firefox binary

  Capybara::Selenium::Driver.new(app, browser: :firefox, options: options)
end

Capybara.javascript_driver = :selenium_firefox

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...
end

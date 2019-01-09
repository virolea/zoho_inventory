# Test Coverage
require 'simplecov'
SimpleCov.start

require "bundler/setup"
require "zoho_inventory"
require 'webmock/rspec'

PROJECT_ROOT = ::File.expand_path("../", __FILE__)

# Stubbed APIs
require "#{PROJECT_ROOT}/support/apis/contacts_api.rb"
require "#{PROJECT_ROOT}/support/apis/items_api.rb"
require "#{PROJECT_ROOT}/support/apis/organizations_api.rb"
require "#{PROJECT_ROOT}/support/apis/users_api.rb"
require "#{PROJECT_ROOT}/support/apis/invoices_api.rb"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  # Disable all real network connections
  WebMock.disable_net_connect!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

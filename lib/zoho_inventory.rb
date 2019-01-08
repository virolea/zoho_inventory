## Version
require "zoho_inventory/version"

## Dependencies
require 'faraday'
require 'json'

## API client
require "zoho_inventory/client"
require "zoho_inventory/request"

## API resources
# Abstract class
require "zoho_inventory/zoho_object"

# Models
require "zoho_inventory/contact"
require "zoho_inventory/invoice"
require "zoho_inventory/item"
require "zoho_inventory/organization"
require "zoho_inventory/user"

## Support
require 'zoho_inventory/util'

module ZohoInventory
  @api_base = "https://inventory.zoho.com/api"

  class << self
    attr_accessor :organization_id, :auth_token, :api_base

    def credentials
      [ZohoInventory.organization_id, ZohoInventory.auth_token]
    end
  end

  # Errors
  class ZohoError < StandardError; end
end

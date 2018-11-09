# Version
require "zoho_inventory/version"

# Dependencies
require 'faraday'
require 'json'

# API client
require "zoho_inventory/client"

# API resources
require "zoho_inventory/resource"
require "zoho_inventory/item"

module ZohoInventory
  @api_base = "https://inventory.zoho.com/api/v1/"

  class << self
    attr_accessor :organization_id, :auth_token, :api_base

    def credentials
      [ZohoInventory.organization_id, ZohoInventory.auth_token]
    end
  end

  # Errors
  class ZohoError < StandardError; end
end

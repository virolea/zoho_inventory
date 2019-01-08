require_relative "api"

module OrganizationsAPI
  include Api

  def resource_url(path = nil)
    ZohoInventory::Organization.build_url_from_path("/v1/organizations#{path}")
  end

  def object_name
    ZohoInventory::Organization::OBJECT_NAME
  end

  def object_class
    ZohoInventory::Organization
  end
end

require_relative "api"

module ItemsAPI
  include Api

  def resource_url(path = nil)
    ZohoInventory::Item.build_url_from_path("/v1/items#{path}")
  end

  def object_name
    ZohoInventory::Item::OBJECT_NAME
  end

  def object_class
    ZohoInventory::Item
  end
end

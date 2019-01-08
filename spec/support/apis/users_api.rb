require_relative "api"

module UsersAPI
  include Api

  def resource_url(path = nil)
    ZohoInventory::User.build_url_from_path("/v1/users#{path}")
  end

  def object_name
    ZohoInventory::User::OBJECT_NAME
  end

  def object_class
    ZohoInventory::User
  end
end

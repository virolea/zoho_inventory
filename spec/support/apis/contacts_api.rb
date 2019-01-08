require_relative "api"

module ContactsAPI
  include Api

  def resource_url(path = nil)
    ZohoInventory::Contact.build_url_from_path("/v1/contacts#{path}")
  end

  def object_name
    ZohoInventory::Contact::OBJECT_NAME
  end

  def object_class
    ZohoInventory::Contact
  end
end

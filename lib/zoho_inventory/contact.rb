module ZohoInventory
  class Contact < ZohoObject
    accept_api_methods [:list, :create, :retrieve, :update, :delete]

    OBJECT_NAME = "contact".freeze
  end
end

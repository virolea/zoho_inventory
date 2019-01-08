module ZohoInventory
  class Organization < ZohoObject
    accept_api_methods [:list, :create, :retrieve, :update]

    OBJECT_NAME = "organization".freeze
  end
end

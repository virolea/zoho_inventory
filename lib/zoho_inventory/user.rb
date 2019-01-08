module ZohoInventory
  class User < ZohoObject
    accept_api_methods [:list, :create, :retrieve, :update, :delete]

    OBJECT_NAME = "user".freeze
  end
end

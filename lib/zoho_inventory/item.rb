module ZohoInventory
  class Item < ZohoObject
    accept_api_methods [:list, :create, :retrieve, :update, :delete]

    OBJECT_NAME = "item".freeze
  end
end

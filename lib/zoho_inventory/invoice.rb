module ZohoInventory
  class Invoice < ZohoObject
    accept_api_methods [:list, :create, :retrieve, :update, :delete]

    OBJECT_NAME = "invoice".freeze
  end
end

module ZohoInventory
  module Util
    def self.object_classes
      @object_classes ||= {
        Item::OBJECT_NAME => Item
      }
    end

    def self.remote_object_key
      @remote_object_keys ||= {
        Item::OBJECT_NAME => 'item'
      }
    end
  end
end

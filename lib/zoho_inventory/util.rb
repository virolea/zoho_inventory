module ZohoInventory
  module Util
    def self.object_classes
      @object_classes ||= {
        Item::OBJECT_NAME => Item,
        Contact::OBJECT_NAME => 'Contact'
      }
    end

    def self.remote_object_key
      @remote_object_keys ||= {
        Item::OBJECT_NAME => 'item',
        Contact::OBJECT_NAME => 'contact'
      }
    end
  end
end

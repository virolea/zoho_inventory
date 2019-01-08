module ZohoInventory
  module Util
    def self.object_classes
      @object_classes ||= {
        Item::OBJECT_NAME => Item,
        Contact::OBJECT_NAME => Contact,
        Organization::OBJECT_NAME => Organization
      }
    end

    def self.remote_object_key
      @remote_object_keys ||= {
        Item::OBJECT_NAME => 'item',
        Contact::OBJECT_NAME => 'contact',
        Organization::OBJECT_NAME => 'organization'
      }
    end
  end
end

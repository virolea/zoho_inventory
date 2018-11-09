module ZohoInventory
  module Util
    def self.object_classes
      @object_classes ||= {
        Item::OBJECT_NAME => Item
      }
    end

    def construct_from(data)
      case data
      when Array
       # Array handling
      when Hash
        object_classes(data[:object]).construct_from(data)
      end
    end
  end
end

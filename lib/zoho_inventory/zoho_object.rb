module ZohoInventory
  class ZohoObject
    def initialize(id)
      @id = id
    end

    def initialize_from(values_hash)
      keys = values_hash.keys
      values = values_hash.values
      defi
    end
  end
end

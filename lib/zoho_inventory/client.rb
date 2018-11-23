module ZohoInventory
  class Client
    def self.default_client
      @conn ||= set_conn
    end

    class << self
      private

      def set_conn
        Faraday.new do |faraday|
          faraday.request :url_encoded
          faraday.adapter Faraday.default_adapter
        end
      end
    end
  end
end

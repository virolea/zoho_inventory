module ZohoInventory
  class Client
    attr_accessor :conn

    def initialize
      self.conn ||= set_conn
    end

    def request(method, path, params)
      query_params = nil

      conn.run_request(method, url, body, headers) do
        req.params = query_params if query_params
      end
    end

    private

    def set_conn
      Faraday.new do |faraday|
        faraday.request  :url_encoded
        faraday.response :logger
        faraday.adapter Faraday.default_adapter
      end
    end
  end
end

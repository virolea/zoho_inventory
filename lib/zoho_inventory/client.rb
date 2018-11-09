module ZohoInventory
  class Client
    def initialize
      @conn = set_conn
    end

    def request(method, path, key = nil, params = {})
      query_params = nil
      headers = {}
      url = build_url_from_path(path)
      body = { JSONString: params.to_json }
      r = @conn.run_request(method, url, body, headers) do
        req.params = query_params if query_params
      end
      response = JSON.parse(r.body)
      handle_response(response, key)
    end

    private

    def set_conn
      Faraday.new do |faraday|
        faraday.request  :url_encoded
        faraday.adapter Faraday.default_adapter
      end
    end

    def build_url_from_path(path, query_params = {})
      api_base = ZohoInventory.api_base
      organization_id, auth_token = ZohoInventory.credentials
      query_params.merge!({ authtoken: auth_token, organization_id: organization_id })
      encoded_params = URI.encode_www_form(query_params)
      "#{api_base}#{path}?#{encoded_params}"
    end

    def handle_response(response, key)
      if response["code"] == 0
        key ? response[key] : response["message"]
      else
        message = response["message"]
        raise ZohoError, message
     end
    end
  end
end

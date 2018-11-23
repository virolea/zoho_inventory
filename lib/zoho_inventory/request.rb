module ZohoInventory
  module Request
    def request(method, path, object_name = nil, params = {})
      client = Client.default_client
      query_params = nil
      headers = {}
      url = build_url_from_path(path)
      body = { JSONString: params.to_json }
      r = client.run_request(method, url, body, headers) do |req|
        req.params = query_params if query_params
      end
      response = JSON.parse(r.body)
      handle_response(response, object_name)
    end

    private

    def handle_response(response, object_name)
      if response["code"] == 0
        if object_name
          object = Util.object_classes[object_name]
          results = [response[object_name], response["#{object_name}s"]].compact[0]
        else
          response["message"]
        end
      else
        message = response["message"]
        raise ZohoError, message
      end
    end
  end
end

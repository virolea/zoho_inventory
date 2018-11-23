module ZohoInventory
  class ZohoObject
    # Zoho Object abstract class
    # It implements methods common to all resources available from Zoho

    extend Request
    attr_reader :values

    @list = false
    @create = false
    @retrieve = false
    @update = false
    @delete = false

    def self.accept_api_methods(methods)
      @list = methods.include? :list
      @create = methods.include? :create
      @retrieve = methods.include? :retrieve
      @update = methods.include? :update
      @delete = methods.include? :delete
    end

    def self.api_methods
      {
        list: @list,
        create: @create ,
        retrieve: @retrieve,
        update: @update,
        delete: @delete
      }
    end

    class << self
      private

      def client
        ZohoInventory::Client.new
      end

      def check_authorized_methods(method)
        raise "You cannot call #{method.to_s} on this resource" unless api_methods[method]
      end
    end

    def self.build_url_from_path(path, query_params = {})
      api_base = ZohoInventory.api_base
      organization_id, auth_token = ZohoInventory.credentials
      query_params.merge!({ authtoken: auth_token, organization_id: organization_id })
      encoded_params = URI.encode_www_form(query_params)
      "#{api_base}#{path}?#{encoded_params}"
    end

    def self.resource_url
      "/v1/#{self::OBJECT_NAME}s"
    end

    def self.object_key
      Util.remote_object_key[self::OBJECT_NAME]
    end

    def self.list
      check_authorized_methods(:list)
      request(:get, resource_url, self::OBJECT_NAME)
    end

    def self.create(params = {})
      check_authorized_methods(:create)
      request(:post, resource_url, object_key, params)
    end

    def self.retrieve(id)
      check_authorized_methods(:retrieve)
      request(:get, "#{resource_url}/#{id}", self::OBJECT_NAME)
    end

    def self.update(id, params = {})
      check_authorized_methods(:update)
      request(:put, "#{resource_url}/#{id}", object_key, params)
    end

    def self.delete(id)
      check_authorized_methods(:delete)
      request(:delete, "#{resource_url}/#{id}")
    end
  end
end

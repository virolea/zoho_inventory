module ZohoInventory
  class Resource
    @list = false
    @create = false
    @retrieve = false
    @update = false
    @delete = false
    @resource = nil

    def self.accept_api_methods(methods)
      @list = methods.include? :list
      @create = methods.include? :create
      @retrieve = methods.include? :retrieve
      @update = methods.include? :update
      @delete = methods.include? :delete
    end

    def self.resource(resource)
      @resource = resource
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

    def self.list
      check_authorized_methods(:list)
      client.request(:get, @resource, @resource)
    end

    def self.create(params = {})
      check_authorized_methods(:create)
      client.request(:post, @resource, @resource[0..-2], params)
    end

    def self.retrieve(id)
      check_authorized_methods(:retrieve)
      client.request(:get, "#{@resource}/#{id}", @resource[0..-2])
    end

    def self.update(id, params = {})
      check_authorized_methods(:update)
      client.request(:put, "#{@resource}/#{id}", @resource[0..-2], params)
    end

    def self.delete(id)
      check_authorized_methods(:delete)
      client.request(:delete, "#{@resource}/#{id}")
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
  end
end

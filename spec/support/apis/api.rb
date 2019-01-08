require_relative "fixtures"

module Api
  include Fixtures

  def stub_get_resources
    url = resource_url
    response = json_response("#{object_name}s/get_#{object_name}s")
    stub_request(:get, url)
      .to_return(status: 200, body: response, headers: {})
  end

  def stub_get_resource(id)
    url = resource_url(id)
    response = json_response("#{object_name}s/get_#{object_name}")
    stub_request(:get, url)
      .to_return(status: 200, body: response, headers: {})
  end

  def stub_post_resource
    url = resource_url
    response = json_response("#{object_name}s/post_#{object_name}")
    stub_request(:post, url)
      .to_return(status: 200, body: response, headers: {})
  end

  def stub_put_resource(id)
    url = resource_url(id)
    response = json_response("#{object_name}s/put_#{object_name}")
    stub_request(:put, url)
      .to_return(status: 200, body: response, headers: {})
  end

  def stub_delete_resource(id)
    url =resource_url(id)
    response = json_response("#{object_name}s/delete_#{object_name}")
    stub_request(:delete, url)
      .to_return(status: 200, body: response, headers: {})
  end

  def test_listable(key, value)
    stub_get_resources
    items = object_class.list
    assert_requested :get, resource_url
    expect(items).to be_a(Array)
    expect(items[0][key]).to eq(value)
  end

  def test_retrievable(key, value)
    stub_get_resource('/item_id')
    item = object_class.retrieve('item_id')
    assert_requested :get, resource_url('/item_id')
    expect(item).to be_a(Hash)
    expect(item[key]).to eq(value)
  end

  def test_creatable(key, value)
    stub_post_resource
    item = object_class.create({ name: 'Name' })
    assert_requested :post, resource_url
    expect(item).to be_a(Hash)
    expect(item[key]).to eq(value)
  end

  def test_updatable(key, value)
    stub_put_resource('/item_id')
    item = object_class.update('item_id', { name: 'Name' })
    assert_requested :put, resource_url('/item_id')
    expect(item).to be_a(Hash)
    expect(item[key]).to eq(value)
  end

  def test_deletable(value)
    stub_delete_resource('/item_id')
    response = object_class.delete('item_id')
    assert_requested :delete, resource_url('/item_id')
    expect(response).to be_a(String)
    expect(response).to eq(value)
  end
end

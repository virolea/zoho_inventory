require 'spec_helper'

RSpec.describe 'Item' do
  include ItemsAPI

  context "API" do
    it "is listable" do
      test_listable('name', 'Bags-small')
    end
    it "is retrievable" do
      test_retrievable('name', 'Bags-small')
    end
    it "is creatable" do
      test_creatable('name', 'Bags-small')
    end

    it 'is updatable' do
      test_updatable('name', 'Bags-small')
    end

    it 'is deletable' do
      test_deletable('The item has been deleted.')
    end
  end
end


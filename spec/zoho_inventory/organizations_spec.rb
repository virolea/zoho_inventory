require 'spec_helper'

RSpec.describe 'Organization' do
  include OrganizationsAPI

  context "API" do
    it "is listable" do
      test_listable('name', 'Zillium Inc')
    end
    it "is retrievable" do
      test_retrievable('name', 'Zillium Inc')
    end
    it "is creatable" do
      test_creatable('name', 'Zillium Inc')
    end

    it 'is updatable' do
      test_updatable('name', 'Zillium Inc')
    end
  end
end


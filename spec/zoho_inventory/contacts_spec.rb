require 'spec_helper'

RSpec.describe 'Contact' do
  include ContactsAPI

  context "API" do
    it "is listable" do
      test_listable('contact_name', 'Bowman and Co')
    end
    it "is retrievable" do
      test_retrievable('contact_name', 'Bowman and Co')
    end
    it "is creatable" do
      test_creatable('contact_name', 'Bowman and Co')
    end

    it 'is updatable' do
      test_updatable('contact_name', 'Bowman and Co')
    end

    it 'is deletable' do
      test_deletable('The contact has been deleted.')
    end
  end
end


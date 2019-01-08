require 'spec_helper'

RSpec.describe 'User' do
  include UsersAPI

  context "API" do
    it "is listable" do
      test_listable('name', 'David Sujin')
    end
    it "is retrievable" do
      test_retrievable('name', 'David Sujin')
    end
    it "is creatable" do
      test_creatable('name', 'David Sujin')
    end

    it 'is updatable' do
      test_updatable('name', 'David Sujin')
    end

    it 'is deletable' do
      test_deletable('The user has been removed from your organization.')
    end
  end
end


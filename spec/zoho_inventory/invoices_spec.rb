require 'spec_helper'

RSpec.describe 'Invoice' do
  include InvoicesAPI

  context "API" do
    it "is listable" do
      test_listable('invoice_number', 'INV-00003')
    end
    it "is retrievable" do
      test_retrievable('invoice_number', 'INV-00003')
    end
    it "is creatable" do
      test_creatable('invoice_number', 'INV-00003')
    end

    it 'is updatable' do
      test_updatable('invoice_number', 'INV-00003')
    end

    it 'is deletable' do
      test_deletable('The invoice has been deleted.')
    end
  end
end


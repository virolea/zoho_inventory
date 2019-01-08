require_relative "api"

module InvoicesAPI
  include Api

  def resource_url(path = nil)
    ZohoInventory::Invoice.build_url_from_path("/v1/invoices#{path}")
  end

  def object_name
    ZohoInventory::Invoice::OBJECT_NAME
  end

  def object_class
    ZohoInventory::Invoice
  end
end

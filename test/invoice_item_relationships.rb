require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/invoice_item"
require_relative "../lib/sales_engine"

class InvoiceItemRelationshipstest < Minitest::Test

  def setup
    @engine = SalesEngine.new("./test/fixtures")
    @engine.startup
    @invoice_item = @engine.invoice_item_repository.all[1]
  end

  def test_it_can_find_invoice_by_invoice_id
    assert_equal 1, @invoice_item.find_invoice_by_invoice_id(1).id
    refute_equal 2, @invoice_item.find_invoice_by_invoice_id(1).id
  end

  def test_it_can_find_item_by_item_id
    assert_equal 1, @invoice_item.find_item_by_item_id(1).id
    refute_equal 2, @invoice_item.find_item_by_item_id(1).id
  end
end

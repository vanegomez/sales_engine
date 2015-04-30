require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/invoice"
require_relative "../lib/sales_engine"

class InvoiceRelationshipstest < Minitest::Test

  def setup
    @engine = SalesEngine.new("./test/fixtures")
    @engine.startup
    @invoice = @engine.invoice_repository.all[1]
  end

  def test_it_can_find_transaction
    assert_equal 2, @invoice.transactions.invoice_id
    refute_equal 1, @invoice.transactions.invoice_id
  end

  def test_it_returns_invoice_items
    assert_equal [9,10], @invoice.invoice_items.map { |invoice_item| invoice_item.id }
  end
end

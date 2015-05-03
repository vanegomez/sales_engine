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
    assert_equal 1, @invoice.transactions.length
    refute_equal 2, @invoice.transactions.length
  end

  def test_it_finds_invoice_items_by_id
    assert_equal [9,10], @invoice.invoice_items.map { |invoice_item| invoice_item.id }
  end

  def test_it_can_find_items
    @engine = SalesEngine.new("../sales_engine/data")
    @engine.startup
    @invoice_real = @engine.invoice_repository.all[1]
    assert_equal "Item Illum Velit", @invoice_real.items[0].name
  end

  def test_it_can_find_customer
    assert_equal "Joey", @invoice.customer.first_name
  end

  def test_it_can_find_merchants
    assert_equal "Klein, Rempel and Jones", @invoice.merchant.name
  end
end

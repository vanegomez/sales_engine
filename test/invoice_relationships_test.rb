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

  def test_it_finds_invoice_items_by_id
    assert_equal [9,10], @invoice.invoice_items.map { |invoice_item| invoice_item.id }
  end

  def test_it_can_find_items
    assert_equal @invoice.items[0].name, "Item Autem Minima"
  end

  def test_it_can_find_customers
    assert_equal @invoice.customers[0].first_name, "Cecelia"
  end

  def test_it_can_find_merchants
    assert_equal @invoice.merchants[0].name, "Klein, Rempel and Jones"
  end
end

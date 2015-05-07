require "minitest/autorun"
require "minitest/pride"
require_relative "./test_helper.rb"
require_relative "../lib/invoice"
require_relative "../lib/sales_engine"

class InvoiceRelationshipstest < Minitest::Test

  def setup
    @engine ||= SalesEngine.new("./test/fixtures")
    @engine.startup
    @invoice_repository ||= @engine.invoice_repository
    @invoice ||= @invoice_repository.all[1]

    @data_engine ||= SalesEngine.new("../sales_engine/data")
    @data_engine.startup
    @invoice_repo ||= @data_engine.invoice_repository
    @invoice_real ||= @invoice_repo.all[1]
  end

  def test_it_can_find_transaction
    assert_equal 1, @invoice.transactions.length
    refute_equal 2, @invoice.transactions.length
  end

  def test_it_finds_invoice_items_by_id
    assert_equal [9,10], @invoice.invoice_items.map { |invoice_item| invoice_item.id }
  end

  def test_it_can_find_items
    assert_equal "Item Illum Velit", @invoice_real.items[0].name
  end

  def test_it_can_find_customer
    assert_equal "Joey", @invoice.customer.first_name
  end

  def test_it_can_find_merchants
    assert_equal "Willms and Sons", @invoice.merchant.name
  end

  def test_it_can_find_by_status
    assert_equal 1, @invoice_repo.find_by_status("shipped").id
  end

  def test_it_can_find_all_by_status
    assert_equal 1, @invoice_repository.find_all_by_status("pending").length
    assert_equal 29, @invoice_repository.find_all_by_status("pending").first.id
  end

  def test_it_can_find_by_invoice_id
    assert_equal 1, @invoice_repo.find_by_invoice_id(1).id
  end

  def test_it_can_find_all_transactions_by_invoice
    assert_equal 1, @invoice_repo.find_all_transactions_by_invoice(1).
    flatten.first.id
  end

  def test_it_can_find_invoice_items_by_invoice_id
    assert_equal 1, @invoice_repo.find_invoice_items_by_invoice(1).first.id
  end

  def test_it_can_find_item
    assert_equal 1, @invoice_repository.find_item(1).id
  end

  def test_it_can_find_merchant
    assert_equal 1, @invoice_repository.find_merchant(1).id
  end

  def test_it_can_find_customer
    assert_equal 1, @invoice_repository.find_customer(1).id
  end

  def test_it_can_find_shipped_invoices
    assert_equal 1, @invoice_repository.shipped_invoices.first.id
  end

  def test_it_can_find_successful_invoices
    assert_equal 1, @invoice_repository.successful_invoices.first.id
  end
end

require_relative "./test_helper.rb"
require_relative "../lib/invoice_item"
require_relative "../lib/sales_engine"

class InvoiceItemRelationshipstest < Minitest::Test

  def setup
    @engine ||= SalesEngine.new("./test/fixtures")
    @engine.startup
    @invoice_item_repository ||= @engine.invoice_item_repository
    @invoice_item ||= @invoice_item_repository.all[1]
  end

  def test_it_can_find_invoice_by_invoice_id
    assert_equal 1, @invoice_item_repository.find_invoice_by_invoice_id(1).id
    refute_equal 2, @invoice_item_repository.find_invoice_by_invoice_id(1).id
  end

  def test_it_can_find_item_by_item_id
    assert_equal 1, @invoice_item_repository.find_item_by_item_id(1).id
    refute_equal 2, @invoice_item_repository.find_item_by_item_id(1).id
  end

  def test_it_can_find_item_id_by_invoice
    assert_equal 1, @invoice_item_repository.find_item_id_by_invoice(29).id
  end

  def test_it_can_create_invoice_items
    item = @engine.find_item_by_item_id(1)
    @invoice_item_repository.create_invoice_items(136, item, 2)
    assert_equal 136, @invoice_item_repository.all.last.id
  end
end

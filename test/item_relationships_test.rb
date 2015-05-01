require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/item"
require_relative "../lib/sales_engine"

class ItemRelationshipsTest < Minitest::Test
  def setup
    @engine = SalesEngine.new("./test/fixtures")
    @engine.startup
    @item = @engine.item_repository.all.first
  end

  def test_it_returns_invoice_items_by_item_id
    assert_equal [135], @item.invoice_items.map { |invoice_item| invoice_item.id }
  end

  def test_it_returns_items_by_merchant_id
    assert_equal [1,2,3,4,5,6,7,8,9,10], @item.merchant.map { |merchant_id| merchant_id.id }
  end
end

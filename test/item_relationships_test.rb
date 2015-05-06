require "minitest/autorun"
require "minitest/pride"
require_relative "./test_helper.rb"
require_relative "../lib/item"
require_relative "../lib/sales_engine"

class ItemRelationshipsTest < Minitest::Test
  def setup
    @engine ||= SalesEngine.new("./test/fixtures")
    @engine.startup
    @item ||= @engine.item_repository.all.first
  end

  def test_it_returns_invoice_items_by_item_id
    assert_equal [135], @item.invoice_items.map { |invoice_item| invoice_item.id }
  end

  def test_it_returns_merchant_by_merchant_id
    assert_equal "Schroeder-Jerde", @item.merchant.name
  end
end

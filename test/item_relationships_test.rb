require_relative "./test_helper.rb"
require "date"
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

  def test_it_finds_best_day
    date = Date.parse("2012-03-25 14:54:09 UTC")
    assert_equal date, @item.best_day
  end

  def test_revenue
    assert_equal 0, @item.revenue
  end

  def test_quantity_sold
    assert_equal 0, @item.quantity_sold.to_i
  end

  def test_find_items
    assert_equal 1, @engine.item_repository.find_items(1).first.id
  end

  def test_most_items
    assert_equal 1, @engine.item_repository.most_items(1).length
    assert_equal 10, @engine.item_repository.most_items(1).first.id
  end

  def test_most_revenue
    assert_equal 1, @engine.item_repository.most_revenue(1).length
    assert_equal 10, @engine.item_repository.most_revenue(1).first.id
  end
end

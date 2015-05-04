require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/merchant"
require_relative "../lib/sales_engine"

class MerchantRelationshipsTest < Minitest::Test

  def setup
    @engine = SalesEngine.new("./test/fixtures")
    @engine.startup
    @merchant = @engine.merchant_repository.all.first
  end

  def test_it_returns_items_by_merchant_id
    assert_equal [1,2,3,4,5,6,7,8,9,10], @merchant.items.map { |item| item.id }
  end

  def test_it_returns_invoices_by_merchant_id
    @merchant = @engine.merchant_repository.all[-1]
    assert_equal [1], @merchant.invoices.map { |invoice| invoice.id }
  end

  def test_it_returns_transactions
    skip
  end

  def test_it_returns_favorite_customer
    skip
  end

  def test_it_returns_customers_with_pending_invoices
    skip
  end

  def test_it_returns_total_revenue
    new_engine = SalesEngine.new("../sales_engine/data")
    new_engine.startup
    new_merchant = new_engine.merchant_repository.find_by_id(1)
    assert_equal 528774, new_merchant.revenue.to_i
  end

end


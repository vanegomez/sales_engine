require "minitest/autorun"
require "minitest/pride"
require_relative "./test_helper.rb"
require_relative "../lib/merchant"
require_relative "../lib/sales_engine"

class MerchantRelationshipsTest < Minitest::Test

  def setup
    @engine ||= SalesEngine.new("./test/fixtures")
    @engine.startup
    @merchant_repo ||= @engine.merchant_repository
    @merchant = @merchant_repo.all.first

    @new_engine ||= SalesEngine.new("../sales_engine/data")
    @new_engine.startup
    @new_merchant_repo ||= @new_engine.merchant_repository
  end

  def test_it_returns_items_by_merchant_id
    assert_equal [1,2,3,4,5,6,7,8,9,10], @merchant.items.map { |item| item.id }
  end

  def test_it_returns_invoices_by_merchant_id
    @merchant = @engine.merchant_repository.all[-1]
    assert_equal [2], @merchant.invoices.map { |invoice| invoice.id }
  end

  def test_it_returns_transactions
    new_merchant = @new_merchant_repo.find_by_id(1)
    assert_equal 30, new_merchant.transactions.first.id
  end

  def test_it_returns_favorite_customer
    fave_customer = @new_merchant_repo.find_by_id(1).favorite_customer
    assert_equal 7, fave_customer.id
  end

  def test_it_returns_customers_with_pending_invoices
      assert_equal "Parker", @merchant.customers_with_pending_invoices.first.first_name
  end

  def test_it_returns_total_revenue_for_a_merchant
    merch = @new_merchant_repo.find_by_id(1)
    assert_equal 528774, merch.revenue.to_i
  end

  def test_it_returns_top_revenue_for_all_merchant
    assert_equal "Dicki-Bednar", @new_merchant_repo.most_revenue(1).first.name
  end

  def test_it_can_return_revenue_for_a_merchant_for_a_date
    assert_equal 4760, @new_merchant_repo.all.first.revenue(Date.parse "Tue, 20 Mar 2012").to_i
  end

end

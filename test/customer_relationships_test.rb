require_relative "./test_helper.rb"
require_relative "../lib/customer"
require_relative "../lib/sales_engine"

class CustomerRelationshipstest < Minitest::Test

  def setup
    @engine ||= SalesEngine.new("./test/fixtures")
    @engine.startup
    @customer ||= @engine.customer_repository.all.first

    @real_engine ||= SalesEngine.new("../sales_engine/data")
    @real_engine.startup
    @real_customer ||= @real_engine.customer_repository.all.first
  end

  def test_it_can_find_invoices
    assert_equal 1, @customer.invoices.first.customer_id
  end

  def test_it_can_find_transactions
    assert_equal 7, @customer.transactions.length
  end

  def test_it_can_find_favorite_merchant
    assert_equal 26, @real_customer.favorite_merchant.id
  end
end

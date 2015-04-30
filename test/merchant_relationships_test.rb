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
end

require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/customer"
require_relative "../lib/sales_engine"

class CustomerRelationshipstest < Minitest::Test

  def setup
    @engine = SalesEngine.new("./test/fixtures")
    @engine.startup
    @customer = @engine.customer_repository.all.first
  end

  def test_it_can_find_invoices
    assert_equal 1, @customer.invoices.first.customer_id.to_i
  end
end

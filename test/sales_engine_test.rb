require_relative "./test_helper.rb"
require_relative "../lib/sales_engine"


class SalesEngineTest < Minitest::Test

  def test_setup
    @sales_engine = SalesEngine.new("./test/fixtures")
    @sales_engine.startup
    assert @sales_engine.transaction_repository
    assert @sales_engine.customer_repository
    assert @sales_engine.merchant_repository
    assert @sales_engine.invoice_item_repository
    assert @sales_engine.invoice_repository
    assert @sales_engine.item_repository
  end
end

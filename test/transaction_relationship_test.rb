require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/transaction"
require_relative "../lib/sales_engine"

class TransactionRelationshipstest < Minitest::Test
  attr_reader :transaction_repo,
              :invoice_repository

  def setup
    @engine = SalesEngine.new("./test/fixtures")
    @engine.startup
    @transaction = @engine.transaction_repository.all.first
  end

  def test_it_can_find_invoices
    assert_equal 1, @transaction.invoice.id
  end
end

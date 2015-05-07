require_relative "./test_helper.rb"
require_relative "../lib/transaction"
require_relative "../lib/sales_engine"

class TransactionRelationshipstest < Minitest::Test
  attr_reader :transaction_repo,
              :invoice_repository

  def setup
    @engine ||= SalesEngine.new("./test/fixtures")
    @engine.startup
    @transaction_repo = @engine.transaction_repository
    @transaction ||= @transaction_repo.all.first
  end

  def test_it_can_find_invoices
    assert_equal 1, @transaction.invoice.id
  end

  def test_it_can_check_status
    assert @transaction.successful?
  end

  def test_it_can_find_invoice
    assert_equal 1, @transaction_repo.find_invoice(1).id
  end

  def test_it_returns_successful_transactions
    assert_equal Array, @transaction_repo.successful_transactions?.class
    assert_equal 10, @transaction_repo.successful_transactions?.length
  end
end

require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/transaction_repository.rb"
require_relative "../lib/sales_engine"

class TransactionRepositoryTest < Minitest::Test
  attr_reader :data,
              :transaction_repository,
              :engine

  def setup
    @engine = SalesEngine.new("./test/fixtures")
    @engine.startup
    @transaction_repository = engine.transaction_repository
  end

  def test_it_can_access_a_single_transaction
    assert_equal 1, transaction_repository.transactions[0].id
  end

  def test_it_loads_all
    assert_equal Array, transaction_repository.all.class
    assert_equal 10, transaction_repository.all.count
    assert_equal Transaction, transaction_repository.all[0].class
  end

  def test_random_can_pick_one_transaction
    assert_equal Transaction, transaction_repository.random.class
    refute_equal Array, transaction_repository.random.class
  end

  def test_it_finds_transaction_by_id
    assert_equal 2, transaction_repository.find_by_id(2).invoice_id
  end

  def test_it_finds_all_transactions_by_id
    assert_equal Array, transaction_repository.find_all_by_id(2).class
    assert_equal 1, transaction_repository.find_all_by_id(2).size
  end

  def test_it_finds_transaction_by_invoice_id
    assert_equal "4354495077693036", transaction_repository.find_by_invoice_id(4).credit_card_number
  end

  def test_it_finds_all_transactions_by_invoice_id
    assert_equal Array, transaction_repository.find_all_by_invoice_id(2).class
    assert_equal 1, transaction_repository.find_all_by_invoice_id(2).length
  end

  def test_it_finds_transaction_by_credit_card_number
    assert_equal "2012-03-27 14:54:09 UTC", transaction_repository.find_by_credit_card_number("4654405418249632").created_at
  end

  def test_it_finds_all_transactions_by_credit_card_number
    assert_equal Array, transaction_repository.find_all_by_credit_card_number("4580251236515201").class
    assert_equal 1, transaction_repository.find_all_by_credit_card_number("4580251236515201").length
  end

  def test_it_finds_transaction_by_credit_card_expiration_date
    assert_equal 1, transaction_repository.find_by_credit_card_expiration_date(nil).invoice_id
  end

  def test_it_finds_all_transactions_by_credit_card_expiration_date
    assert_equal Array, transaction_repository.find_all_by_credit_card_expiration_date(nil).class
    assert_equal 10, transaction_repository.find_all_by_credit_card_expiration_date(nil).length
  end

  def test_it_finds_transaction_by_result
    assert_equal nil, transaction_repository.find_by_result("failed")
  end

  def test_it_finds_all_transactions_by_result
    assert_equal Array, transaction_repository.find_all_by_result("success").class
    assert_equal 10, transaction_repository.find_all_by_result("success").length
  end

  def test_it_finds_transaction_by_date_updated
    assert_equal "2012-03-27 14:54:09 UTC", transaction_repository.find_by_updated_at("2012-03-27 14:54:09 UTC").created_at
  end

  def test_it_finds_all_transactions_by_date_updated
    assert_equal Array, transaction_repository.find_all_by_updated_at("2012-03-27 14:54:09 UTC").class
    assert_equal 2, transaction_repository.find_all_by_updated_at("2012-03-27 14:54:09 UTC").length
  end
end

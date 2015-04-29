require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/transaction.rb"

class TransactionTest < Minitest::Test
  attr_accessor :data

  def setup
    @data = {
              id: "1",
              invoice_id: "1",
              credit_card_number: "1234567812345678",
              credit_card_expiration_date: "x",
              result: "success",
              created_at: "2012-03-27 14:54:09 UTC",
              updated_at: "2012-03-27 14:54:09 UTC"
            }
    @transaction = Transaction.new(data, nil)
    end

  def test_it_exists
    assert @transaction
  end

  def test_it_has_an_id
    assert_equal 1, @transaction.id.to_i
  end

  def test_it_has_an_invoice_id
    assert_equal 1, @transaction.invoice_id.to_i
  end

  def test_it_has_a_credit_card_number
    assert_equal "1234567812345678", @transaction.credit_card_number
  end

  def test_it_has_a_credit_card_expiration_date
    assert_equal "x", @transaction.credit_card_expiration_date
  end

  def test_it_has_a_result
    assert_equal "success", @transaction.result
  end

  def test_it_has_a_created_at
    assert_equal "2012-03-27 14:54:09 UTC", @transaction.created_at
  end

  def test_it_has_a_updated_at
    assert_equal "2012-03-27 14:54:09 UTC", @transaction.updated_at
  end
end

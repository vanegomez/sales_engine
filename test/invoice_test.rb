require "minitest/autorun"
require "minitest/pride"
require_relative "./test_helper.rb"
require_relative "../lib/invoice"

class InvoiceTest < Minitest::Test
  attr_accessor :data

  def setup
    @data = {
      id: "1",
      customer_id: "123",
      merchant_id: "456",
      status: "shipped",
      created_at: "2012-03-27 14:53:59 UTC",
      updated_at: "2012-03-27 14:53:59 UTC"
    }
  end

  def test_it_exists
    assert Invoice
  end

  def test_it_has_an_id
    invoice = Invoice.new(data, nil)
    assert_equal 1, invoice.id
  end

  def test_it_has_a_customer_id
    invoice = Invoice.new(data, nil)
    assert_equal 123, invoice.customer_id.to_i
  end

  def test_it_has_a_merchant_id
    invoice = Invoice.new(data, nil)
    assert_equal 456, invoice.merchant_id.to_i
  end

  def test_it_has_a_status
    invoice = Invoice.new(data, nil)
    assert_equal "shipped", invoice.status
  end

  def test_it_has_a_created_at
    invoice = Invoice.new(data, nil)
    assert_equal "2012-03-27 14:53:59 UTC", invoice.created_at.to_s
  end

  def test_it_has_a_updated_at
    invoice = Invoice.new(data, nil)
    assert_equal "2012-03-27 14:53:59 UTC", invoice.updated_at.to_s
  end
end

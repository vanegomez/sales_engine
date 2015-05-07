require_relative "./test_helper.rb"
require_relative "../lib/invoice_item"

class InvoiceItemTest < Minitest::Test
  attr_reader :data,
              :repository

  def setup
    data = {
      id:         "1",
      item_id:    "539",
      invoice_id: "1",
      quantity:   "5",
      unit_price: "13635",
      created_at: "2012-03-27 14:54:09 UTC",
      updated_at: "2012-03-27 14:54:09 UTC"
    }
    @invoice_item = InvoiceItem.new(data, nil)
  end

  def test_it_has_an_id
    assert_equal 1, @invoice_item.id
  end

  def test_it_has_an_item_id
    assert_equal 539, @invoice_item.item_id
  end

  def test_it_has_a_quantity
    assert_equal 5, @invoice_item.quantity.to_i
  end

  def test_it_has_a_unit_price
    assert_equal 136, @invoice_item.unit_price.to_i
  end

  def test_invoice_item_was_created_at
    assert_equal "2012-03-27 14:54:09 UTC", @invoice_item.created_at
  end

  def test_invoice_item_was_updated_at
    assert_equal "2012-03-27 14:54:09 UTC", @invoice_item.updated_at
  end

  def test_it_has_revenue
    assert_equal 681, @invoice_item.revenue.to_i
  end
end

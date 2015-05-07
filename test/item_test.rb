require_relative "./test_helper.rb"
require_relative "../lib/item"

class ItemTest < Minitest::Test
  attr_accessor :data,
                :repository

  def setup
    @data = { id: "1",
              name: "Passing Spec Harness",
              description:  "A normally impossible item to acquire that we will sell to you for a large chunk of cash",
              unit_price: "99999",
              merchant_id: "1",
              created_at: "2012-03-27 14:53:59 UTC",
              updated_at: "2012-03-27 14:53:59 UTC"
            }
    @item = Item.new(data, nil)
  end

  def test_it_exists
    assert Item
  end

  def test_it_has_an_id
    assert_equal 1, @item.id
  end

  def test_it_has_a_name
    assert_equal "Passing Spec Harness", @item.name
  end

  def test_it_has_a_description
    assert_equal "A normally impossible item to acquire that we will sell to you for a large chunk of cash", @item.description
  end

  def test_it_has_a_unit_price
    assert "99999", @item.unit_price
  end

  def test_it_has_a_merchant_id
    assert_equal 1, @item.merchant_id
  end

  def test_it_has_a_created_at
    assert_equal "2012-03-27 14:53:59 UTC", @item.created_at
  end

  def test_it_has_a_updated_at
    assert_equal "2012-03-27 14:53:59 UTC", @item.updated_at
  end
end

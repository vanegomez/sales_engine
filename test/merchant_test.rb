require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/merchant"

class MerchantTest < Minitest::Test
  attr_reader :data,
              :repository

  def setup
    data = {
      id: "1",
      name: "Schroeder-Jerde",
      created_at: "2012-03-27 14:53:59 UTC",
      updated_at: "2012-03-27 14:53:59 UTC"
    }
    @merchant = Merchant.new(data, nil)
  end

  def test_it_has_an_id
    assert_equal 1, @merchant.id
  end

  def test_it_has_a_name
    assert_equal "Schroeder-Jerde", @merchant.name
  end

  def test_costumer_was_created_at
    assert_equal "2012-03-27 14:53:59 UTC", @merchant.created_at
  end

  def test_costumer_was_updated_at
    assert_equal "2012-03-27 14:53:59 UTC", @merchant.updated_at
  end
end

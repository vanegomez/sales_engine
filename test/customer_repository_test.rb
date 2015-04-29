require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/sales_engine.rb"

class CustomerRepositoryTest < Minitest::Test
  attr_reader :customer_repository

  def setup
    @engine = SalesEngine.new("./test/fixtures")
    @engine.startup
    @customer_repository = @engine.customer_repository
  end

  def test_it_exists
    assert @customer_repository
  end

  def test_it_returns_all
    assert_equal 10, customer_repository.all.length.to_i
    assert_equal Array, customer_repository.all.class
  end

  def test_it_returns_random_customer
    refute_equal customer_repository.random, customer_repository.random
  end

  def test_it_finds_by_id
    assert_equal "Cecelia", customer_repository.find_by_id(2).first_name
  end

  def test_it_finds_all_by_id
    assert_equal "Cecelia", customer_repository.find_all_by_id(2)[0].first_name
  end

  def test_finds_by_first_name
    assert_equal 2, customer_repository.find_by_first_name("Cecelia").id
  end

  def test_it_finds_all_by_first_name
    assert_equal "Osinski", customer_repository.find_all_by_first_name("Cecelia")[0].last_name
  end

  def test_it_finds_by_last_name
    assert_equal 2, customer_repository.find_by_last_name("Osinski").id
  end

  def test_it_finds_all_by_last_name
    assert_equal "Cecelia", customer_repository.find_all_by_last_name("Osinski")[0].first_name
  end

  def test_find_by_created_at
   assert_equal 1, customer_repository.find_by_created_at("2012-03-27 14:54:09 UTC").id
  end

  def test_find_all_by_created_at
   assert_equal 6, customer_repository.find_all_by_created_at("2012-03-27 14:54:10 UTC").length
  end

  def test_find_by_updated_at
   assert_equal 1, customer_repository.find_by_updated_at("2012-03-27 14:54:09 UTC").id
  end

  def test_find_all_by_updated_at
   assert_equal 6, customer_repository.find_all_by_updated_at("2012-03-27 14:54:10 UTC").length
  end
end

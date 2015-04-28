require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/sales_engine.rb"

class CustomerRepositoryTest < Minitest::Spec
  attr_reader :customer_repository

  def setup
    @engine = SalesEngine.new("../data")
    @engine.startup
    @customer_repository = @engine.customer_repository
  end

  def test_it_exists
    assert @customer_repository
  end

  def test_it_returns_random_customer
    refute_equal customer_repository.random, customer_repository.random
  end

  def test_it_finds_by_id
    assert_equal "Cecelia", customer_repository.find_by_id(2).first_name
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

end

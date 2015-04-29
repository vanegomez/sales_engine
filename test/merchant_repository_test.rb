require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/sales_engine.rb"

class MerchantRepositoryTest < Minitest::Spec
  attr_reader :merchant_repository,
              :data

  def setup
    @engine = SalesEngine.new("./test/fixtures")
    @engine.startup
    @merchant_repository = @engine.merchant_repository
  end

  def test_it_finds_all_merchants
    skip
    assert_equal Array, merchant_repository.all
  end

  # def test_it_returns_random_customer
  #   refute_equal merchant_repository.random, merchant_repository.random
  # end
  #
  # def test_it_finds_by_id
  #   assert_equal "Cecelia", merchant_repository.find_by_id(2).first_name
  # end
  #
  # def test_finds_by_first_name
  #   assert_equal 2, merchant_repository.find_by_first_name("Cecelia").id
  # end
  #
  # def test_it_finds_all_by_first_name
  #   assert_equal "Osinski", merchant_repository.find_all_by_first_name("Cecelia")[0].last_name
  # end
  #
  # def test_it_finds_by_last_name
  #   assert_equal 2, merchant_repository.find_by_last_name("Osinski").id
  # end
  #
  # def test_it_finds_all_by_last_name
  #   assert_equal "Cecelia", merchant_repository.find_all_by_last_name("Osinski")[0].first_name
  # end

end

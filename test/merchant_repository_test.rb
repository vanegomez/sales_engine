require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/sales_engine"

class MerchantRepositoryTest < Minitest::Test
  attr_reader :merchant_repository,
              :data

  def setup
    @engine = SalesEngine.new("./test/fixtures")
    @engine.startup
    @merchant_repository = @engine.merchant_repository
  end

  def test_it_finds_all_merchants
    assert_equal Array, merchant_repository.all.class
    assert_equal 11, merchant_repository.all.length.to_i
  end

  def test_it_returns_random_merchant
    sample_one = []
    sample_two = []
    10.times { sample_one << merchant_repository.random }
    10.times { sample_two << merchant_repository.random }
    refute_equal sample_one, sample_two
  end

  def test_it_finds_by_id
    assert_equal "Klein, Rempel and Jones", merchant_repository.find_by_id(2).name
  end

  def test_it_finds_all_by_id
    assert_equal 1, merchant_repository.find_all_by_id(3).count
  end

  def test_finds_by_name
    assert_equal 2, merchant_repository.find_by_name("Klein, Rempel and Jones").id
  end

  def test_it_finds_all_by_name
    assert_equal 2, merchant_repository.find_all_by_name("Williamson Group").length
  end

  def test_it_finds_by_created_at
    assert_equal 1, merchant_repository.find_by_created_at("2012-03-27 14:53:59 UTC").id
  end

  def test_it_finds_all_by_created_at
    assert_equal 9, merchant_repository.find_all_by_created_at("2012-03-27 14:53:59 UTC").length
  end

  def test_it_finds_by_updated_at
    assert_equal 6, merchant_repository.find_by_updated_at("2012-03-27 16:12:25 UTC").id
  end

  def test_it_finds_all_by_updated_at
    assert_equal 8, merchant_repository.find_all_by_updated_at("2012-03-27 14:53:59 UTC").length
  end
end

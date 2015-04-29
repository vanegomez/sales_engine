require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/sales_engine"

class InvoiceItemRepositoryTest < Minitest::Test
  attr_reader :invoice_item_repository,
              :data

  def setup
    @engine = SalesEngine.new("./test/fixtures")
    @engine.startup
    @invoice_item_repository = @engine.invoice_item_repository
  end

  def test_it_finds_all_invoice_items
    assert_equal Array, invoice_item_repository.all.class
    assert_equal 10, invoice_item_repository.all.count
  end

  def test_it_returns_random_invoice_item
    sample_one = []
    sample_two = []
    10.times { sample_one << invoice_item_repository.random }
    10.times { sample_two << invoice_item_repository.random }
    refute_equal sample_one, sample_two
  end

  def test_it_finds_by_id
    assert invoice_item_repository.find_by_id(1)
  end

  def test_it_finds_all_by_id
    assert_equal 1, invoice_item_repository.find_all_by_id(1).count
  end

  def test_finds_by_item_id
    assert_equal 1, invoice_item_repository.find_by_item_id("539").
  end

  def test_it_finds_all_by_item_id
    skip
    assert_equal 2, invoice_item_repository.find_all_by_item_id("Williamson Group").length
  end
  #
  # def test_it_finds_by_created_at
  #   assert_equal 1, invoice_item_repository.find_by_created_at("2012-03-27 14:53:59 UTC").id
  # end
  #
  # def test_it_finds_all_by_created_at
  #   assert_equal 9, invoice_item_repository.find_all_by_created_at("2012-03-27 14:53:59 UTC").length
  # end
  #
  # def test_it_finds_by_updated_at
  #   assert_equal 6, invoice_item_repository.find_by_updated_at("2012-03-27 16:12:25 UTC").id
  # end
  #
  # def test_it_finds_all_by_updated_at
  #   assert_equal 8, invoice_item_repository.find_all_by_updated_at("2012-03-27 14:53:59 UTC").length
  # end
end

# id,item_id,invoice_id,quantity,unit_price,created_at,updated_at
# 1,539,1,5,13635,2012-03-27 14:54:09 UTC,2012-03-27 14:54:09 UTC

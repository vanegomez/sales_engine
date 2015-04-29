require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/sales_engine"

class ItemRepositoryTest < Minitest::Test
  attr_reader :item_repository

  def setup
    @engine = SalesEngine.new("./test/fixtures")
    @engine.startup
    @item_repository = @engine.item_repository
  end

  def test_it_can_access_a_single_item
    assert_equal "Item Qui Esse", item_repository.items[0].name
  end

  def test_it_loads_all
    assert_equal Array, @item_repository.all.class
    assert_equal 10, @item_repository.all.count
    assert_equal Item, @item_repository.all[0].class
  end

  def test_random_can_pick_one_item
    assert_equal Item, item_repository.random.class
    refute_equal Array, item_repository.random.class
  end

  def test_it_finds_item_by_id
    assert_equal "Item Qui Esse", item_repository.find_by_id(1).name
  end

  def test_it_finds_all_items_by_id
    assert_equal Array, item_repository.find_all_by_id(3).class
    assert_equal 1, item_repository.find_all_by_id(3).length
  end

  def test_find_by_created_at
    assert_equal 1, item_repository.find_by_created_at("2012-03-27 14:53:59 UTC").id
  end

  def test_find_all_by_created_at
    assert_equal Array, item_repository.find_all_by_created_at("2012-03-27 14:53:59 UTC").class
    assert_equal 10, item_repository.find_all_by_created_at("2012-03-27 14:53:59 UTC").length
  end

  def test_find_by_updated_at
    assert_equal 1, item_repository.find_by_updated_at("2012-03-27 14:53:59 UTC").id
  end

  def test_find_all_by_updated_at
    assert_equal Array, item_repository.find_all_by_updated_at("2012-03-27 14:53:59 UTC").class
    assert_equal 10, item_repository.find_all_by_updated_at("2012-03-27 14:53:59 UTC").length
  end

  def test_find_by_name
    assert_equal 1, item_repository.find_by_name("Item Qui Esse").id
  end

  def test_find_all_by_name
    assert_equal Array, item_repository.find_all_by_name("Item Ea Voluptatum").class
    assert_equal 1, item_repository.find_all_by_name("Item Ea Voluptatum").length
  end

  def test_find_by_description
    assert_equal 3, item_repository.find_by_description("Sunt officia eum qui molestiae. Nesciunt quidem cupiditate reiciendis est commodi non. Atque eveniet sed. Illum excepturi praesentium reiciendis voluptatibus eveniet odit perspiciatis. Odio optio nisi rerum nihil ut.").id
  end

  def test_find_all_by_description
    assert_equal Array, item_repository.find_all_by_description("Sunt officia eum qui molestiae. Nesciunt quidem cupiditate reiciendis est commodi non. Atque eveniet sed. Illum excepturi praesentium reiciendis voluptatibus eveniet odit perspiciatis. Odio optio nisi rerum nihil ut.").class
    assert_equal 1, item_repository.find_all_by_description("Sunt officia eum qui molestiae. Nesciunt quidem cupiditate reiciendis est commodi non. Atque eveniet sed. Illum excepturi praesentium reiciendis voluptatibus eveniet odit perspiciatis. Odio optio nisi rerum nihil ut.").length
  end

  def test_find_by_unit_price
    assert_equal 6, item_repository.find_by_unit_price("15925").id
  end

  def test_find_all_by_unit_price
    assert_equal Array, item_repository.find_all_by_unit_price(343.55).class
    assert_equal 0, item_repository.find_all_by_unit_price(343.55).length
  end

  def test_find_by_merchant_id
    assert_equal 1, item_repository.find_by_merchant_id(1).id
  end

  def test_find_all_by_merchant_id
    assert_equal Array, item_repository.find_all_by_merchant_id(1).class
    assert_equal 10, item_repository.find_all_by_merchant_id(1).length
  end

end

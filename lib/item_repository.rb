require_relative "item"

class ItemRepository
  attr_reader :items,
              :data

  def initialize(data, engine)
    @items = data.map { |row| Item.new(row, self) }
    @engine = engine
  end

  def all
    @items
  end

  def random
    @items.sample
  end

  def find_by_id(id)
    @items.find {|item| item.id == id}
  end

  def find_all_by_id(id)
    @items.find_all {|item| item.id == id}
  end

  def find_by_name(name)
    @items.find {|item| item.name == name}
  end

  def find_all_by_name(name)
    @items.find_all {|item| item.name == name}
  end

  def find_by_description(description)
    @items.find {|item| item.description == description}
  end

  def find_all_by_description(description)
    @items.find_all {|item| item.description == description}
  end

  def find_by_unit_price(unit_price)
    @items.find {|item| item.unit_price == unit_price}
  end

  def find_all_by_unit_price(unit_price)
    @items.find_all {|item| item.unit_price == unit_price}
  end

  def find_by_merchant_id(merchant_id)
    @items.find {|item| item.merchant_id == merchant_id}
  end

  def find_all_by_merchant_id(merchant_id)
    @items.find_all {|item| item.merchant_id == merchant_id}
  end

  def find_by_created_at(created_at)
    @items.find {|item| item.created_at == created_at}
  end

  def find_all_by_created_at(created_at)
    @items.find_all {|item| item.created_at == created_at}
  end

  def find_by_updated_at(updated_at)
    @items.find {|item| item.updated_at == updated_at}
  end

  def find_all_by_updated_at(updated_at)
    @items.find_all {|item| item.updated_at == updated_at}
  end

  def find_items(id)
    @items.find_all { |item| item.id == id}
  end

  def find_invoice_items_by_item_id(id)
    @engine.find_invoice_items_by_item_id(id)
  end

  def find_merchant_by_merchant_id(merchant_id)
    @engine.find_merchant_by_merchant_id(merchant_id)
  end

  def find_all_by_merchant_id(merchant_id)
    @items.find_all { |item| item.merchant_id == merchant_id }
  end

  def most_items(x)
    items.sort_by do |item|
      item.quantity_sold.nil? ? 0 : item.quantity_sold
    end.reverse.first(x)
  end

  def most_revenue(x)
    items.sort_by do |item|
      item.revenue.nil? ? 0 : item.revenue
    end.reverse.first(x)
  end

  def inspect
    "#<#{self.class} #{@items.size} rows>"
  end
end

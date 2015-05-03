require_relative "merchant"

class MerchantRepository
  attr_reader :merchants,
              :data

  def initialize(data, engine)
    @merchants = data.map { |row| Merchant.new(row, self) }
    @engine = engine
  end

  def all
    @merchants
  end

  def random
    @merchants.sample
  end

  def find_by_id(id)
    @merchants.find {|merchant| merchant.id == id}
  end

  def find_all_by_id(id)
    @merchants.find_all {|merchant| merchant.id == id}
  end

  def find_by_name(name)
    @merchants.find {|merchant| merchant.name == name}
  end

  def find_all_by_name(name)
    @merchants.find_all {|merchant| merchant.name == name}
  end

  def find_by_created_at(created_at)
    @merchants.find {|merchant| merchant.created_at == created_at}
  end

  def find_all_by_created_at(created_at)
    @merchants.find_all {|merchant| merchant.created_at == created_at}
  end

  def find_by_updated_at(updated_at)
    @merchants.find {|merchant| merchant.updated_at == updated_at}
  end

  def find_all_by_updated_at(updated_at)
    @merchants.find_all {|merchant| merchant.updated_at == updated_at}
  end

  def find_all_items_by_merchant_id(id)
    @engine.find_all_items_by_merchant_id(id)
  end

  def find_all_invoices_by_merchant_id(id)
    @engine.find_all_invoices_by_merchant_id(id)
  end

  def revenue(date)
    @merchants.map { |merchant| merchant.revenue(date) }.reduce(0, :+)
  end

  def most_revenue(x)
    merchants.sort_by do |merchant|
      merchant.revenue
    end.reverse.first(x)
  end

  def inspect
    "#<#{self.class} #{@merchants.size} rows>"
  end
end

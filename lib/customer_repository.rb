require_relative "customer.rb"

class CustomerRepository
  attr_reader :customers,
              :data

  def initialize(data, engine)
    @engine = engine
    @customers = data.map {|row| Customer.new(row, self) }
  end

  def all
    @customers
  end

  def random
    @customers.sample
  end

  def find_by_id(id)
    @customers.find {|customer| customer.id == id}
  end

  def find_by_first_name(first_name)
    @customers.find {|customer| customer.first_name == first_name}
  end

  def find_all_by_first_name(first_name)
    @customers.find_all {|customer| customer.first_name == first_name}
  end

  def find_by_last_name(last_name)
    @customers.find {|customer| customer.last_name == last_name}
  end

  def find_all_by_last_name(last_name)
    @customers.find_all {|customer| customer.last_name == last_name}
  end

  def find_invoices(id)
    @engine.find_invoices_by_customer_id(id)
  end

  def inspect
    "#<#{self.class} #{@customer.size} rows>"
  end
end

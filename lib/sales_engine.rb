require "csv"
require_relative "customer.rb"
require_relative "customer_repository.rb"

class SalesEngine
  attr_reader :customer_repository

  def initialize(filepath)
   @filepath = filepath
  end

  def startup
   customer_data = Parser.parse("#{@filepath}/customers.csv")
   @customer_repository     = CustomerRepository.new(customer_data, self)
  end

  if __FILE__ == $0
  engine = SalesEngine.new("../data")
  engine.startup
  test = engine.customer_repository
  puts test.find_by_first_name("Cecelia").id
  end
end

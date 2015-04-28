require "csv"
require_relative "csv_parser.rb"
require_relative "customer.rb"
require_relative "customer_repository.rb"
require_relative "invoice_repository.rb"
require_relative "invoice.rb"

class SalesEngine
  attr_reader :customer_repository,
              :invoice_repository

  def initialize(filepath)
   @filepath = filepath
  end

  def startup
   customer_data            = Parser.parse("#{@filepath}/customers.csv")
   @customer_repository     = CustomerRepository.new(customer_data, self)
   invoice_data             = Parser.parse("#{@filepath}/invoices.csv")
   @invoice_repository      = InvoiceRepository.new(invoice_data, self)
  end

  def find_invoices_by_customer_id(id)
   @invoice_repository.find_all_by_customer_id(id)
  end

  if __FILE__ == $0
    engine = SalesEngine.new("../data")
    engine.startup
    test = engine.customer_repository
    puts test.random
  end
end

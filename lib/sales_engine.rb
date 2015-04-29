require "csv"
require_relative "csv_parser"
require_relative "customer"
require_relative "customer_repository"
require_relative "invoice"
require_relative "invoice_repository"
require_relative "transaction"
require_relative "transaction_repository"
require_relative "merchant"
require_relative "merchant_repository"
require_relative "item"
require_relative "item_repository"
require_relative "invoice_item"
require_relative "invoice_item_repository"

class SalesEngine
  attr_reader :customer_repository,
              :invoice_repository,
              :transaction_repository,
              :merchant_repository,
              :item_repository,
              :invoice_item_repository

  def initialize(filepath)
   @filepath = filepath
  end

  def startup
    customer_data             = Parser.parse("#{@filepath}/customers.csv")
    @customer_repository      = CustomerRepository.new(customer_data, self)
    invoice_data              = Parser.parse("#{@filepath}/invoices.csv")
    @invoice_repository       = InvoiceRepository.new(invoice_data, self)
    transaction_data          = Parser.parse("#{@filepath}/transactions.csv")
    @transaction_repository   = TransactionRepository.new(transaction_data, self)
    merchant_data             = Parser.parse("#{@filepath}/merchants.csv")
    @merchant_repository      = MerchantRepository.new(merchant_data, self)
    # item_data                 = Parser.parse("#{@filepath}/items.csv")
    # @item_repository          = ItemRepository.new(item_data, self)
    invoice_item_data         = Parser.parse("#{@filepath}/invoice_items.csv")
    @invoice_item_repository  = InvoiceItemRepository.new(invoice_item_data, self)
  end

  def find_invoices_by_customer_id(id)
    @invoice_repository.find_all_by_customer_id(id)
  end

  if __FILE__ == $0
    engine = SalesEngine.new("../data")
    engine.startup
  end
end

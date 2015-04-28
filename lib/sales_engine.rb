require "csv"
require_relative "merchant"
require_relative "merchant_repository"

class SalesEngine
  # your code goes here
end

if __FILE__ == $0
  engine = SalesEngine.new
  engine.startup

  engine.merchant_repository
  engine.invoice_repository
  engine.item_repository
  engine.invoice_item_repository
  engine.customer_repository
  engine.transaction_repository
end

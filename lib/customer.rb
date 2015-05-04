require_relative "customer_repository.rb"

class Customer
  attr_reader :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at,
              :repository

  def initialize(data, repository)
    @id          = data[:id].to_i
    @first_name  = data[:first_name]
    @last_name   = data[:last_name]
    @created_at  = data[:created_at]
    @updated_at  = data[:updated_at]
    @repository  = repository
  end

  def invoices
    @repository.find_invoices(id)
  end

  def transactions
    invoices.map { |invoice| invoice.transactions }.flatten
  end

  def favorite_merchant
    successful_transactions = transactions.find_all { |transaction|
      transaction.result == "success"}
    successful_invoices = successful_transactions.map do |transaction|
      transaction.invoice
        end
    successful_merchants = successful_invoices.map do |invoice|
      invoice.merchant
        end
    successful_merchants.max_by do |merchant|
      successful_merchants.count(merchant)
    end
  end
end

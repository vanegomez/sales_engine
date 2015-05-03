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
    @invoices ||= @repository.find_invoices(id)
  end

  def transactions
    invoices.map { |invoice| invoice.transactions }
  end

  def favorite_merchant
    successful_transactions = transactions.find_all {|transaction| transaction.result == "success"}
    merchants_transations = successful_transactions.map { |success| success.invoice.merchants }[0]
    # merchants_transactions.max_by { |merchant| merchant.invoices.transations.map }
  end
end

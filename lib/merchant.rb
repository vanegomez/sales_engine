require_relative "merchant_repository"
class Merchant
  attr_reader :id,
              :name,
              :created_at,
              :updated_at,
              :repository

  def initialize(data, repository)
    @id          = data[:id].to_i
    @name        = data[:name]
    @created_at  = data[:created_at]
    @updated_at  = data[:updated_at]
    @repository  = repository
  end

  def items
    @items ||= @repository.find_all_items_by_merchant_id(id)
  end

  def invoices
    @invoices ||= @repository.find_all_invoices_by_merchant_id(id)
  end

  def transactions
    @transactions ||= invoices.map do |invoice| invoice.transactions
    end.flatten
  end

  def successful_transactions
    transactions.select do |transaction|
      transaction.result == "success"
    end
  end

  def successful_invoices
    successful_transactions.map do |transaction|
      transaction.invoice
    end
  end

  def successful_customers
    successful_invoices.map do |invoice|
      invoice.customer
    end
  end

  def favorite_customer
    successful_customers.max_by do |customer|
      successful_customers.count(customer)
    end
  end

  def pending_invoices
    invoices - successful_invoices
  end

  def customers_with_pending_invoices
    pending_invoices.flat_map do |pending_invoice|
      pending_invoice.customer
    end
  end

  def revenue
    invoice_items = successful_invoices.flat_map { |successful_invoice| successful_invoice.invoice_items }
    invoice_items.flat_map { |invoice_item| invoice_item.revenue }.reduce(:+)
  end
end

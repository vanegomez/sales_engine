class Invoice
  attr_reader :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at,
              :repository

  def initialize(data, repository)
    @id          = data[:id].to_i
    @customer_id = data[:customer_id].to_i
    @merchant_id = data[:merchant_id].to_i
    @status      = data[:status]
    @created_at  = data[:created_at]
    @updated_at  = data[:updated_at]
    @repository  = repository
  end

  def transactions
    @transactions ||= @repository.find_transaction_by_invoice(id)
  end

  def invoice_items
    @invoice_items ||= @repository.find_invoice_item_by_invoice(id)
  end

  def items
    @items ||= @repository.find_items(id)
  end

  def customers
    @customers ||= @repository.find_customers(id)
  end

  def merchants
    @merchants ||= @repository.find_merchants(id)
  end
end

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
    @transactions ||= @repository.find_all_transactions_by_invoice(id)
  end

  def invoice_items
    @invoice_items ||= @repository.find_invoice_item_by_invoice(id)
  end

  def items
     @items ||= invoice_items.map { |invoice_item| invoice_item.item }
  end

  def customer
    @customer ||= @repository.find_customer(customer_id)
  end

  def merchants
    @merchants ||= @repository.find_merchants(id)
  end
end

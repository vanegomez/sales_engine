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
    @repository.find_all_transactions_by_invoice(id)
  end

  def invoice_items
    @invoice_items ||= @repository.find_invoice_items_by_invoice(id)
  end

  def items
    @items ||= invoice_items.map { |invoice_item| invoice_item.item }
  end

  def customer
    @customer ||= @repository.find_customer(customer_id)
  end

  def merchant
    @merchant ||= @repository.find_merchant(merchant_id)
  end

  def charge(card)
    repository.create_transaction(card, id)
  end
end

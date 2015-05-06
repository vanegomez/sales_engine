require_relative "invoice.rb"

class InvoiceRepository
  attr_reader :invoices,
              :data

  def initialize(data, engine)
    @engine = engine
    @invoices = data.map { |row| Invoice.new(row, self) }
  end

  def all
    @invoices
  end

  def random
    @invoices.sample
  end

  def find_by_id(id)
    @invoices.find { |invoice| invoice.id == id }
  end

  def find_all_by_id(id)
    @invoices.find_all { |invoice| invoice.id == id }
  end

  def find_by_customer_id(customer_id)
    @invoices.find { |invoice| invoice.customer_id == customer_id }
  end

  def find_all_by_customer_id(id)
    @invoices.find_all { |invoice| invoice.customer_id == id }
  end

  def find_by_merchant_id(merchant_id)
    @invoices.find { |invoice| invoice.merchant_id == merchant_id }
  end

  def find_all_by_merchant_id(merchant_id)
    @invoices.find_all { |invoice| invoice.merchant_id == merchant_id }
  end

  def find_by_status(status)
    @invoices.find { |invoice| invoice.status == status }
  end

  def find_all_by_status(status)
    @invoices.find_all { |invoice| invoice.status == status }
  end

  def find_by_created_at(created_at)
    @invoices.find { |invoice| invoice.created_at == created_at }
  end

  def find_all_by_created_at(created_at)
    @invoices.find_all { |invoice| invoice.created_at == created_at }
  end

  def find_by_updated_at(updated_at)
    @invoices.find { |invoice| invoice.updated_at == updated_at }
  end

  def find_all_by_updated_at(updated_at)
    @invoices.find_all { |invoice| invoice.updated_at == updated_at }
  end

  def find_by_invoice_id(invoice_id)
    @invoices.find { |invoice| invoice.id == invoice_id }
  end

  def find_all_transactions_by_invoice(id)
   @engine.find_all_transactions_by_invoice(id)
  end

  def find_invoice_items_by_invoice(id)
    @engine.find_invoice_items_by_invoice(id)
  end

  def find_items(id)
    @engine.find_items_by_items_id(id)
  end

  def find_customer(id)
    @engine.find_customer(id)
  end

  def find_merchant(id)
    @engine.find_merchant(id)
  end

  def shipped_invoices
    @invoices.find_all { |invoice| invoice.status == "shipped" }
  end

  def successful_invoices
    @engine.successful_transactions.flat_map do |transaction|
      find_all_by_id(transaction.invoice_id)
    end
  end

  def inspect
    "#<#{self.class} #{@invoices.size} rows>"
  end

  def create(attributes)
    data = {
            id:          "#{invoices.last.id + 1}",
            customer_id: attributes[:customer].id,
            merchant_id: attributes[:merchant].id,
            status:      attributes[:status],
            created_at:  "#{Date.new}",
            updated_at:  "#{Date.new}",
            }

    new_invoice = Invoice.new(data, self)
    invoices << new_invoice

    invoice_id = data[:id]
    unique_items = attributes[:items].uniq
    quantities = attributes[:items].group_by { |item| item }
    unique_items.each do |item|
      quantity = quantities[item].count
      @engine.invoice_item_repository
        .create_invoice_items(invoice_id, item, quantity)
      end
    new_invoice
  end

 def create_transaction(card, id)
    @engine.transaction_repository.create_transaction(card, id)
  end
end

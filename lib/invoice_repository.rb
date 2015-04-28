require_relative "invoice.rb"

class InvoiceRepository
  attr_reader :invoices,
              :data

  def initialize(data, engine)
    @engine = engine
    @invoices = data.map { |row| Invoice.new(row, self) }
  end

  def find_all_by_customer_id(id)
    @invoices.find_all { |invoice| invoice.customer_id.to_i == id }.first.customer_id.to_i
  end
end

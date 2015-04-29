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
    @invoices.find_all { |invoice| invoice.customer_id.to_i == id }
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

  def inspect
    "#<#{self.class} #{@invoices.size} rows>"
  end

end
##finding
# all returns all instances

# random returns a random instance

# find_by_X(match), where X is some attribute, returns a single instance whose X attribute case-insensitive attribute matches the match parameter. For instance, customer_repository.find_by_first_name("Mary") could find a Customer with the first name attribute "Mary" or "mary" but not "Mary Ellen".

# find_all_by_X(match) works just like find_by_X except it returns a collection of all matches. If there is no match, it returns an empty Array.


##relational
# transactions returns a collection of associated Transaction instances

# invoice_items returns a collection of associated InvoiceItem instances

# items returns a collection of associated Items by way of InvoiceItem objects

# customer returns an instance of Customer associated with this object

# merchant returns an instance of Merchant associated with this object

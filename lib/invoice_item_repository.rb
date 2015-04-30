require_relative "invoice_item"

class InvoiceItemRepository
  attr_reader :invoice_items,
              :data

  def initialize(data, engine)
    @engine = engine
    @invoice_items = data.map { |row| InvoiceItem.new(row, self) }
  end

  def all
    @invoice_items
  end

  def random
    @invoice_items.sample
  end

  def find_by_id(id)
    @invoice_items.find { |invoice_item| invoice_item.id == id }
  end

  def find_all_by_id(id)
    @invoice_items.find_all { |invoice_item| invoice_item.id == id }
  end

  def find_by_item_id(item_id)
    @invoice_items.find { |invoice_item| invoice_item.item_id == item_id }
    require 'pry'; binding.pry
  end

  # 3) SalesEngine invoice items Searching .find_by_item_id can find a record
  #    Failure/Error: expect(invoice_item.item.name).to eq "Item Doloribus Ducimus"
  #    NoMethodError:
  #      undefined method `item' for #<InvoiceItem:0x007fe21b3f55e8>
  #    # ./spec/invoice_item_spec.rb:22:in `block (4 levels) in <top (required)>

  def find_all_by_item_id(item_id)
    @invoice_items.find_all { |invoice_item| invoice_item.item_id == item_id }
  end

  def find_by_invoice_id(invoice_id)
    @invoice_items.find { |invoice_item| invoice_item.invoice_id == invoice_id }
  end

  def find_all_by_invoice_id(invoice_id)
    @invoice_items.find_all { |invoice_item| invoice_item.invoice_id == invoice_id }
  end

  def find_by_quantity(quantity)
    @invoice_items.find { |invoice_item| invoice_item.quantity == quantity }
  end

  def find_all_by_quantity(quantity)
    @invoice_items.find_all { |invoice_item| invoice_item.quantity == quantity }
  end

  def find_by_unit_price(unit_price)
    @invoice_items.find { |invoice_item| invoice_item.unit_price == unit_price }
  end

  def find_all_by_unit_price(unit_price)
    @invoice_items.find_all { |invoice_item| invoice_item.unit_price == unit_price }
  end

  def find_by_created_at(created_at)
    @invoice_items.find { |invoice_item| invoice_item.created_at == created_at }
  end

  def find_all_by_created_at(created_at)
    @invoice_items.find_all { |invoice_item| invoice_item.created_at == created_at }
  end

  def find_by_updated_at(updated_at)
    @invoice_items.find { |invoice_item| invoice_item.updated_at == updated_at }
  end

  def find_all_by_updated_at(updated_at)
    @invoice_items.find_all { |invoice_item| invoice_item.updated_at == updated_at }
  end

  def inspect
    "#<#{self.class} #{@invoice_items.size} rows>"
  end
end

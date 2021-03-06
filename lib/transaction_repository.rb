require_relative "transaction.rb"

class TransactionRepository
  attr_reader :transactions

  def initialize(data, engine)
      @engine = engine
      @transactions = data.map { |row| Transaction.new(row, self) }
  end

  def all
    @transactions
  end

  def random
    @transactions.sample
  end

  def find_by_id(id)
    @transactions.find { |transaction| transaction.id == id }
  end

  def find_all_by_id(id)
    @transactions.find_all { |transaction| transaction.id == id }
  end

  def find_by_invoice_id(id)
    @transactions.find { |transaction| transaction.invoice_id == id }
  end

  def find_all_by_invoice_id(invoice_id)
    @transactions.find_all do |transaction|
      transaction.invoice_id == invoice_id
    end
  end

  def find_by_credit_card_number(credit_card_number)
    @transactions.find { |transaction|
      transaction.credit_card_number == credit_card_number }
  end

  def find_all_by_credit_card_number(credit_card_number)
    @transactions.find_all { |transaction|
      transaction.credit_card_number == credit_card_number }
  end

  def find_by_credit_card_expiration_date(credit_card_expiration_date)
    @transactions.find { |transaction|
      transaction.credit_card_expiration_date == credit_card_expiration_date }
  end

  def find_all_by_credit_card_expiration_date(credit_card_expiration_date)
    @transactions.find_all { |transaction|
      transaction.credit_card_expiration_date == credit_card_expiration_date }
  end

  def find_by_result(result)
    @transactions.find { |transaction| transaction.result == result }
  end

  def find_all_by_result(result)
    @transactions.find_all { |transaction| transaction.result == result }
  end

  def find_by_created_at(created_at)
    @transactions.find { |transaction| transaction.created_at == created_at }
  end

  def find_all_by_created_at(created_at)
    @transactions.find_all do |transaction|
      transaction.created_at == created_at
    end
  end

  def find_by_updated_at(updated_at)
    @transactions.find { |transaction| transaction.updated_at == updated_at }
  end

  def find_all_by_updated_at(updated_at)
    @transactions.find_all do |transaction|
      transaction.updated_at == updated_at
    end
  end

  def find_invoice(invoice_id)
    @engine.find_invoice_by_invoice_id(invoice_id)
  end

  def successful_transactions?
    @transactions.find_all {|transaction| transaction.result == "success"}
  end

  def create_transaction(card, id)
    data = {
           id: "#{transactions.last.id + 1}",
           invoice_id: id,
           credit_card_number: card[:credit_card_number],
           credit_card_expiration_date: card[:credit_card_expiration_date],
           result: card[:result],
           created_at: "#{Date.new}",
           updated_at: "#{Date.new}"
          }

     transaction = Transaction.new(data, self)
     @transactions << transaction
   end

  def inspect
    "#<#{self.class} #{@transactions.size} rows>"
  end

end

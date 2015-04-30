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
    @first_name  = data[:first_name].to_i
    @last_name   = data[:last_name].to_i
    @created_at  = data[:created_at]
    @updated_at  = data[:updated_at]
    @repository  = repository
  end

  def invoices
    @invoices ||= @repository.find_invoices(id)
  end
end

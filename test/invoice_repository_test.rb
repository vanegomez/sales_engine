require "minitest/autorun"
require "minitest/pride"
require_relative "./test_helper.rb"
require_relative "../lib/sales_engine.rb"
require_relative "../lib/invoice_repository.rb"


class InvoiceRepositoryTest < Minitest::Test
  attr_reader :data,
              :invoice_repository,
              :engine

  def setup
    @engine = SalesEngine.new("./test/fixtures")
    engine.startup
    @invoice_repository = engine.invoice_repository
  end

  def test_it_can_access_a_single_invoice
    assert_equal 1, invoice_repository.invoices[0].id
  end

  def test_it_can_pick_a_random_invoice
    invoice_array1 = []
    invoice_array2 = []
    10.times { invoice_array1 << @invoice_repository.random }
    10.times { invoice_array2 << @invoice_repository.random }
    refute_equal invoice_array1, invoice_array2
  end

  def test_it_loads_all
    assert_equal Array, invoice_repository.all.class
    assert_equal 11, invoice_repository.all.count
    assert_equal Invoice, invoice_repository.all[0].class
  end

  def test_random_can_pick_one_invoice
    assert_equal Invoice, invoice_repository.random.class
    refute_equal Array, invoice_repository.random.class
  end

  def test_it_finds_invoice_by_id
    result = invoice_repository.find_by_id(1)
    assert_equal 1, result.customer_id.to_i
  end

  def test_it_finds_all_invoices_by_id
    result = invoice_repository.find_all_by_id(3)
    assert_equal Array, result.class
    assert_equal 1, result.length
  end

  def test_find_by_created_at
    result = invoice_repository.find_by_created_at("2012-03-12 05:54:09 UTC")
    assert_equal 2, result.id
  end

  def test_find_all_by_created_at
    result = invoice_repository.find_all_by_created_at("2012-03-12 05:54:09 UTC")
    assert_equal Array, result.class
    assert_equal 1, result.length
  end

  def test_find_by_updated_at
    result = invoice_repository.find_by_updated_at("2012-03-25 09:54:09 UTC")
    assert_equal 1, result.id
  end

  def test_find_all_by_updated_at
    result = invoice_repository.find_all_by_updated_at("2012-03-25 09:54:09 UTC")
    assert_equal Array, result.class
    assert_equal 1, result.length
  end

  def test_find_by_customer_id
    result = invoice_repository.find_by_customer_id(1)
    assert_equal 1, result.id
  end

  def test_find_all_by_customer_id
    result = invoice_repository.find_all_by_customer_id(1)
    assert_equal Array, result.class
    assert_equal 8, result.length
  end

  def test_it_can_check_successful_invoices
    assert_equal 1, @invoice_repository.successful_invoices.first.id
  end

  def test_it_can_find_by_merchant_id
    assert_equal 29, @invoice_repository.find_by_merchant_id(1).id
  end

  def test_it_can_find_all_by_merchant_id
    assert_equal Array, @invoice_repository.find_all_by_merchant_id(76).class
    assert_equal 1, @invoice_repository.find_all_by_merchant_id(76).length
  end
end

require "minitest/autorun"
require "minitest/pride"
require_relative '../lib/csv_parser'

class ParserTest < Minitest::Test
  def test_it_parses_data
    filepath = "./test/fixtures/merchants.csv"
    data = Parser.parse(filepath)
    assert_equal data.path, "./test/fixtures/merchants.csv"
  end
end

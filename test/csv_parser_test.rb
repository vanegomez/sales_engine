require "minitest/autorun"
require "minitest/pride"
require '../lib/csv_parser'

class ParserTest < Minitest::Test
  def test_it_parses_data
    filepath = "../data/merchants.csv"
    data = Parser.parse(filepath)
    assert_equal data.path, "../data/merchants.csv"
  end
end

require "minitest/autorun"
require "minitest/pride"
require_relative "../lib/sales_engine"


class SalesEngineTest < Minitest::Test

  def setup
    @sales_engine = SalesEngine.new("./test/fixtures")
    @sales_engine.startup
  end
end

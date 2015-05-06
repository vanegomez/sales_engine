require "csv"

class Parser
  def self.parse(filepath)
    CSV.open(filepath, headers: true, header_converters: :symbol)
  end
end

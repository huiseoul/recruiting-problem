# A country consists of code and cells.
# - code is a number
# - cells in a array of index
class Country
  attr_reader :code
  attr_accessor :cells

  def initialize(code)
    @code = code
    @cells = []
  end
end

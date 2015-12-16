require 'pry-byebug'
# Solution for solving 'number of country problem'
# see the pdf files in repository
class CountryCounter
  attr_reader :map

  def initialize(map = nil)
    @map = map
  end

  # return array of indexs of neighbored_countries
  # if none, return nil
  def neighbors(row, col)
    neighbored_countries = [
      left_neighbor(row, col),
      right_neighbor(row, col),
      up_neighbor(row, col),
      down_neighbor(row, col)
    ]
    neighbored_countries.compact
  end

  # return index of left-neighbored country
  # if none, return nil
  def left_neighbor(row, col)
    return if col == 0
    [row, col - 1] if @map[row][col - 1] == @map[row][col]
  end

  # return index of right-neighbored country
  # if none, return nil
  def right_neighbor(row, col)
    return if col == @map[row].size
    [row, col + 1] if @map[row][col + 1] == @map[row][col]
  end

  # return index of up-neighbored country
  # if none, return nil
  def up_neighbor(row, col)
    return if row == 0
    [row - 1, col] if @map[row - 1][col] == @map[row][col]
  end

  # return index of down-neighbored country
  # if none, return nil
  def down_neighbor(row, col)
    return if row == @map.size - 1
    [row + 1, col] if @map[row + 1][col] == @map[row][col]
  end
end

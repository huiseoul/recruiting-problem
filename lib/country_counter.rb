require 'country'
require 'pry-byebug'
# Solution for solving 'number of country problem'
# see the pdf files in repository
class CountryCounter
  attr_reader :map, :countries

  def initialize(map = nil)
    @map = map
    @countries = []
    @checker_map = Array.new(map.size) { Array.new(map[0].size) } unless map.nil?
  end

  def solve
    return @countries.size if @map.nil? || !@countries.empty?
    @map.each_index do |row|
      @map[row].each_index do |col|
        next if checked?(row, col)
        country = build_country(row, col)
        mark_as_checked(country)
        @countries << country
      end
    end
    @countries.size
  end

  def checked?(row, col)
    @checker_map[row][col]
  end

  # Set checked to true not to explore already visited cell
  def mark_as_checked(country)
    country.cells.each do |cell|
      @checker_map[cell[0]][cell[1]] = true
    end
  end

  # build a country from given cell. A country has a code and array of index of
  # adjacent cells which have same value of @map[row][col]
  # see country.rb
  def build_country(row, col)
    to_search = [[row, col]]
    country = Country.new(@map[row][col])

    loop do
      target = to_search.pop
      break unless target
      country.cells << target
      neighbors(target[0], target[1]).each do |candidate|
        to_search << candidate unless country.cells.include? candidate
      end
    end

    country
  end

  # return array of indexs of neighbored_countries
  # if none, return empty array
  def neighbors(row, col)
    [
      left_neighbor(row, col),
      right_neighbor(row, col),
      up_neighbor(row, col),
      down_neighbor(row, col)
    ].compact
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

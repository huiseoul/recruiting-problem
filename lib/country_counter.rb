require 'pry-byebug'
# Solution for solving 'number of country problem'
# see the pdf files in repository
class CountryCounter
  attr_reader :map

  def initialize(map = nil)
    @map = map
    @count = 0
    @checked = Array.new(@map.size) { Array.new(@map[0].size) } unless @map.nil?
  end

  def solve
    return @count if @map.nil? || @count > 0
    @map.each_index do |row|
      @map[row].each_index do |col|
        unless marked_as_checked(row, col)
          mark_as_checked(build_country(row, col))
          @count += 1
        end
      end
    end
    @count
  end

  def marked_as_checked(row, col)
    !@checked[row][col].nil?
  end

  # Set checked to true not to explore already visited cell
  def mark_as_checked(country)
    country.each do |index|
      @checked[index[0]][index[1]] = true
    end
  end

  # build a country from given index. A country is array of index of adjacent
  #   cells which have same value of @map[row][col]
  def build_country(row, col)
    to_search = [[row, col]]
    country = []

    loop do
      target = to_search.pop
      break unless target
      country << target
      neighbors(target[0], target[1]).each do |candidate|
        to_search << candidate unless country.include? candidate
      end
    end

    country
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

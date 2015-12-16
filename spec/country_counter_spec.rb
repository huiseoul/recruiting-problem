require 'country_counter'

describe CountryCounter do
  let(:given_map) do
    [
      [5, 4, 4],
      [4, 3, 4],
      [3, 2, 4],
      [2, 2, 2],
      [3, 3, 4],
      [1, 4, 4],
      [4, 1, 1]
    ]
  end
  let(:counter_without_map) { CountryCounter.new }
  let(:country_counter) { CountryCounter.new(given_map) }

  describe '#map' do
    context 'without given map' do
      it 'returns nil' do
        expect(counter_without_map.map).to be nil
      end
    end

    context 'with given map' do
      it 'returns map' do
        expect(country_counter.map)
          .to match_array(given_map)
      end
    end
  end

  describe '#left_neighbor' do
    it 'returns nil, when cell without left neighbor is given' do
      expect(country_counter.left_neighbor(0, 0)).to be nil
    end

    it 'returns index of neighbor, when cell with left neighbor is given' do
      expect(country_counter.left_neighbor(6, 2))
        .to match_array([6, 1])
    end
  end

  describe '#right_neighbor' do
    it 'returns nil, when cell without right neighbor is given' do
      expect(country_counter.right_neighbor(0, 2)).to be nil
    end

    it 'returns index of neighbor, when cell with right neighbor is given' do
      expect(country_counter.right_neighbor(6, 1))
        .to match_array([6, 2])
    end
  end

  describe '#up_neighbor' do
    it 'returns nil, when cell without up neighbor is given' do
      expect(country_counter.up_neighbor(0, 1)).to be nil
    end

    it 'returns index of neighbor, when cell with up neighbor is given' do
      expect(country_counter.up_neighbor(3, 1))
        .to match_array([2, 1])
    end
  end

  describe '#down_neighbor' do
    it 'returns nil, when cell without down neighbor is given' do
      expect(country_counter.down_neighbor(6, 0)).to be nil
    end

    it 'returns index of neighbor, when cell with down neighbor is given' do
      expect(country_counter.down_neighbor(0, 2))
        .to match_array([1, 2])
    end
  end

  describe '#neighbors' do
    it 'returns neighbors for given cell, case 1' do
      expect(country_counter.neighbors(0, 0))
        .to match_array([])
    end

    it 'returns neighbors for given cell, case 2' do
      expect(country_counter.neighbors(5, 2))
        .to match_array([[5, 1], [4, 2]])
    end

    it 'returns neighbors for given cell, case 3' do
      expect(country_counter.neighbors(3, 1))
        .to match_array([[3, 0], [3, 2], [2, 1]])
    end
  end

  describe '#build_country' do
    it 'returns a country built form given index, case 1' do
      expect(country_counter.build_country(0, 0).cells)
        .to match_array([[0, 0]])
    end

    it 'returns a country(array of index) built form given index, case 2' do
      expect(country_counter.build_country(0, 1).cells)
        .to match_array([[0, 1], [0, 2], [1, 2], [2, 2]])
    end

    it 'returns a country(array of index) built form given index, case 3' do
      expect(country_counter.build_country(6, 2).cells)
        .to match_array([[6, 1], [6, 2]])
    end
  end

  describe '#solve' do
    context 'without given map' do
      it 'returns 0' do
        expect(counter_without_map.solve).to be 0
      end
    end

    context 'with given map' do
      it 'returns 11' do
        expect(country_counter.solve).to be 11
      end
    end
  end
end

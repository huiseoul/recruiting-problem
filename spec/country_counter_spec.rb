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
  let(:counter_with_map) { CountryCounter.new(given_map) }

  describe '#map' do
    context 'without given map' do
      it 'returns nil' do
        expect(counter_without_map.map).to be nil
      end
    end

    context 'with given map' do
      it 'returns map' do
        expect(counter_with_map.map)
          .to match_array(given_map)
      end
    end
  end

  describe '#left_neighbor' do
    it 'returns nil, when cell without left neighbor is given' do
      expect(counter_with_map.left_neighbor(0, 0)).to be nil
    end

    it 'returns index of neighbor, when cell with left neighbor is given' do
      expect(counter_with_map.left_neighbor(6, 2))
        .to match_array([6, 1])
    end
  end

  describe '#right_neighbor' do
    it 'returns nil, when cell without right neighbor is given' do
      expect(counter_with_map.right_neighbor(0, 2)).to be nil
    end

    it 'returns index of neighbor, when cell with right neighbor is given' do
      expect(counter_with_map.right_neighbor(6, 1))
        .to match_array([6, 2])
    end
  end

  describe '#up_neighbor' do
    it 'returns nil, when cell without up neighbor is given' do
      expect(counter_with_map.up_neighbor(0, 1)).to be nil
    end

    it 'returns index of neighbor, when cell with up neighbor is given' do
      expect(counter_with_map.up_neighbor(3, 1))
        .to match_array([2, 1])
    end
  end

  describe '#down_neighbor' do
    it 'returns nil, when cell without down neighbor is given' do
      expect(counter_with_map.down_neighbor(6, 0)).to be nil
    end

    it 'returns index of neighbor, when cell with down neighbor is given' do
      expect(counter_with_map.down_neighbor(0, 2))
        .to match_array([1, 2])
    end
  end

  describe '#neighbors' do
    it 'returns neighbors for given cell, case 1' do
      expect(counter_with_map.neighbors(0, 0))
        .to match_array([])
    end

    it 'returns neighbors for given cell, case 2' do
      expect(counter_with_map.neighbors(5, 2))
        .to match_array([[5, 1], [4, 2]])
    end

    it 'returns neighbors for given cell, case 3' do
      expect(counter_with_map.neighbors(3, 1))
        .to match_array([[3, 0], [3, 2], [2, 1]])
    end
  end
end

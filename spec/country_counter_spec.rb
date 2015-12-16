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

  describe '#map' do
    context 'without given map' do
      it 'return nil' do
        expect(CountryCounter.new.map).to be nil
      end
    end

    context 'with given map' do
      it 'return map' do
        expect(CountryCounter.new(given_map).map)
          .to match_array(given_map)
      end
    end
  end
end

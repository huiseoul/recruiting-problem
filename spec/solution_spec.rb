require 'solution'

describe Solution do
  let(:given_problem) do
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
  describe '#problem' do
    context 'without given problem' do
      it 'return nil' do
        expect(Solution.new.problem).to be nil
      end
    end

    context 'with given problem' do
      it 'return problem' do
        expect(Solution.new(given_problem).problem)
          .to match_array(given_problem)
      end
    end
  end
end

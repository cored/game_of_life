RSpec.describe GameOfLife::Worlds::Cells::Neighbors do
  subject(:neighbors) { described_class.for(population) }

  context 'when passing population' do
    let(:population) { GameOfLife::Worlds::Population.for([location_one, location_two, location_three]) }
    let(:location_one) { GameOfLife::Worlds::Location.new(x: 1, y: 1) }
    let(:location_two) { GameOfLife::Worlds::Location.new(x: 1, y: 2) }
    let(:location_three) { GameOfLife::Worlds::Location.new(x: 1, y: 3) }

    it 'calculates the neighbors for every location' do
      expect(
        neighbors.to_h
      ).not_to be_empty
    end
  end
end

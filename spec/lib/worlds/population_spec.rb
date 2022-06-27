RSpec.describe GameOfLife::Worlds::Population  do
  subject(:population) { described_class.for(locations, seed) }
  let(:seed) { 1 }

  let(:locations) do
    [
      location_one,
      location_two,
      location_three,
    ]
  end

  let(:location_one) { GameOfLife::Worlds::Location.for({x: 0, y: 0}) }
  let(:location_two) { GameOfLife::Worlds::Location.for({ x: 0, y: 1 }) }
  let(:location_three) { GameOfLife::Worlds::Location.for({ x: 0, y: 2}) }

  it 'generates a population base on a list of locations' do
    expect(population.to_h).to match({
      [0, 0] => {status: :alive},
      [0, 1] => {status: :alive},
      [0, 2] => {status: :alive},
    })
  end
end

RSpec.describe GameOfLife::Worlds::Location do
  subject(:location) { described_class.for(attrs) }
  let(:attrs) { { x: 1, y: 2 } }

  context 'location knows its coordinates in space' do
    let(:north_locale) { { x: 1, y: 1} }
    let(:south_locale) { { x: 1, y: 3} }
    let(:west_locale) { { x: 2, y: 2} }
    let(:east_locale) { { x: 0, y: 2} }

    it 'knows north' do
      expect(location.north).to eql(described_class.for(north_locale))
    end

    it 'knows south' do
      expect(location.south).to eql(described_class.for(south_locale))
    end

    it 'knows west' do
      expect(location.west).to eql(described_class.for(west_locale))
    end

    it 'knows east' do
      expect(location.east).to eql(described_class.for(east_locale))
    end

  end
end

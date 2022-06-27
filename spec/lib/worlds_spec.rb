RSpec.describe GameOfLife::Worlds::Replace do
  subject(:replace_world) do
    described_class
  end

  let(:world) { GameOfLife::Worlds::World.build(4) }

  context 'when receiving a world' do
    it 'replace cells on every location' do
      replaced_world = replace_world.(world)

      expect(
        replaced_world
      ).not_to be(world)
    end
  end
end

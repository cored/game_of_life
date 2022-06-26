RSpec.describe GameOfLife do
  subject(:simulate) do
    described_class.call(
      generations,
      tick,
      generate_world,
      display_world,
    )
  end
  let(:display_world) { double(:display_world, call: nil) }
  let(:generate_world) { double(:generate_world, call: world) }

  context 'when zero generations' do
    let(:generations) { 0 }
    let(:tick) { 0 }
    let(:world) { double(:world) }

    it 'prints empty world' do
      simulate

      expect(display_world).to have_received(:call).with(world)
    end
  end

  context 'when one generation' do
    let(:generations) { 1 }
    let(:tick) { 0 }
    let(:world) { double(:world) }

    it 'print world generations' do
      simulate

      expect(display_world).to have_received(:call).with(world).twice
    end

  end
end


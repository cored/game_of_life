module GameOfLife
  extend self

  def call(generations,
           time_limit,
           generate_world, replace_world, display_world)
    world = generate_world.call

    1.upto(generations) do |_|
      display_world.(world)
      world = replace_world.(world)
    end

    display_world.(world)
  end
end


RSpec.describe GameOfLife do
  subject(:simulate) do
    described_class.call(
      generations,
      tick,
      generate_world,
      replace_world,
      display_world,
    )
  end
  let(:display_world) { double(:display_world, call: nil) }
  let(:generate_world) { double(:generate_world, call: world) }
  let(:replace_world) { double(:replace_world, call: replaced_world) }

  context 'when zero generations' do
    let(:generations) { 0 }
    let(:tick) { 0 }
    let(:world) { double(:world) }
    let(:replaced_world) { nil }

    it 'prints empty world' do

      simulate

      expect(display_world).to have_received(:call).with(world)
    end
  end

  context 'when one generation' do
    let(:generations) { 1 }
    let(:tick) { 0 }
    let(:world) { double(:world) }
    let(:replaced_world) { double(:replaced_world) }

    it 'prints empty world' do
      allow(replace_world).to receive(:call).with(world).and_return(replaced_world)

      simulate

      expect(display_world).to have_received(:call).with(world)
      expect(display_world).to have_received(:call).with(replaced_world)
    end

  end
end


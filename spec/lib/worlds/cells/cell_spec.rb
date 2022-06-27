RSpec.describe GameOfLife::Worlds::Cells::Cell do
  let(:alive) { described_class.survive! }
  let(:dead) { described_class.die! }

  it 'survives' do
    expect(alive.to_h).to match({ status: :alive })
  end

  it 'dies' do
    expect(dead.to_h).to match({ status: :dead })
  end

  context 'with neighbors' do
    context 'when alive and between two and three alive neighbors' do
      it 'survives' do
        expect(alive.with([alive, alive])).to be_alive
        expect(alive.with([alive, alive, alive])).to be_alive
      end
    end

    context 'when dead and exactly three alive neighbors' do
      it 'survives' do
        expect(dead.with([alive, alive, alive])).to be_alive
      end
    end

    context 'when less than two neighbors' do
      it 'dies' do
        expect(alive.with([alive])).to be_dead
        expect(dead.with([alive])).to be_dead
      end
    end

    context 'when more than three neighboors' do
      it 'dies' do
        expect(alive.with([alive, alive, alive, alive])).to be_dead
        expect(dead.with([alive, alive, alive, alive])).to be_dead
      end
    end

  end


end

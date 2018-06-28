require 'player'

describe Player do

  subject(:player) { described_class.new('X', 'Johny Tester') }

  describe '#name' do
    it 'shows player name' do
      expect(player.name).to eq 'Johny Tester'
    end
  end

  describe '#mark' do
    it 'shows player mark' do
      expect(player.mark).to eq 'X'
    end
  end
end

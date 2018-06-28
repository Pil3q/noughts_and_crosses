require 'game'
describe Game do
  let(:player1) { double(:player1, mark: 'X', name: 'Johny Tester') }
  let(:player2) { double(:player2, mark: 'O', name: 'Jane Tester') }
  subject(:game) { described_class.new(player1, player2) }

  describe '#move' do
    it 'adds player choice to the board' do
      game.move(game.player1, 1)
      expect(game.board[0]).to eq 'X'
    end
    it 'raise an error if move already taken' do
      game.move(game.player1, 1)
      expect { game.move(game.player1, 1) }.to raise_error 'hey, this field is taken'
    end
  end
end

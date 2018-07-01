require 'game'
describe Game do
  let(:player1) { double(:player1, mark: 'X', name: 'Johny Tester') }
  let(:player2) { double(:player2, mark: 'O', name: 'Jane Tester') }
  subject(:game) { described_class.new(player1, player2) }

  describe '#move' do
    it 'adds player choice to the board' do
      game.move(1, game.player1)
      expect(game.board[0]).to eq 'X'
    end
    it 'raise an error if field already taken' do
      game.move(1, game.player1)
      expect { game.move(1, game.player1) }.to raise_error 'hey, this field is taken'
    end
  end
  describe '#game_over' do
    it 'returns a winning message for 1st scenario' do
      winning_scenario1
      expect(game.game_over(player1)).to eq "#{player1.name} won"
    end
    it 'returns a winning message for 2nd scenario' do
      winning_scenario2
      expect(game.game_over(player1)).to eq "#{player1.name} won"
    end
    it 'returns a winning message for 3rd scenario' do
      winning_scenario3
      expect(game.game_over(player1)).to eq "#{player1.name} won"
    end
    it 'returns a winning message for 4th scenario' do
      winning_scenario4
      expect(game.game_over(player1)).to eq "#{player1.name} won"
    end
    it 'returns a winning message for 5th scenario' do
      winning_scenario5
      expect(game.game_over(player1)).to eq "#{player1.name} won"
    end
    it 'returns a winning message for 6th scenario' do
      winning_scenario6
      expect(game.game_over(player1)).to eq "#{player1.name} won"
    end
    it 'returns a winning message for 7th scenario' do
      winning_scenario7
      expect(game.game_over(player1)).to eq "#{player1.name} won"
    end
    it 'returns a winning message for 8th scenario' do
      winning_scenario8
      expect(game.game_over(player1)).to eq "#{player1.name} won"
    end
    it 'returns draw message' do
      draw
      expect(game.game_over(player2)).to eq 'draw'
    end
  end
  describe '#swap players' do
    it 'swaps player after turn' do
      game.move(1)
      game.move(2)
      expect(game.board[1]).to eq 'O'
    end
    it 'swaps player back' do
      game.move(1)
      game.move(2)
      game.move(3)
      expect(game.board[2]).to eq 'X'
    end
  end
  def winning_scenario1
    game.move(1, game.player1)
    game.move(2, game.player1)
    game.move(3, game.player1)
  end
  def winning_scenario2
    game.move(4, game.player1)
    game.move(5, game.player1)
    game.move(6, game.player1)
  end
  def winning_scenario3
    game.move(7, game.player1)
    game.move(8, game.player1)
    game.move(9, game.player1)
  end
  def winning_scenario4
    game.move(1, game.player1)
    game.move(4, game.player1)
    game.move(7, game.player1)
  end
  def winning_scenario5
    game.move(2, game.player1)
    game.move(5, game.player1)
    game.move(8, game.player1)
  end
  def winning_scenario6
    game.move(3, game.player1)
    game.move(6, game.player1)
    game.move(9, game.player1)
  end
  def winning_scenario7
    game.move(1, game.player1)
    game.move(5, game.player1)
    game.move(9, game.player1)
  end
  def winning_scenario8
    game.move(3, game.player1)
    game.move(5, game.player1)
    game.move(7, game.player1)
  end
  def draw
    game.move(1, game.player1)
    game.move(2, game.player2)
    game.move(3, game.player1)
    game.move(5, game.player2)
    game.move(7, game.player1)
    game.move(4, game.player2)
    game.move(6, game.player1)
    game.move(9, game.player2)
    game.move(8, game.player1)
  end
end

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
    it 'returns winning message right after move' do
      expect(winning_scenario1).to eq "#{player1.name} won"
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

  end
  def winning_scenario1
    game.move(game.player1, 1)
    game.move(game.player1, 2)
    game.move(game.player1, 3)
  end
  def winning_scenario2
    game.move(game.player1, 4)
    game.move(game.player1, 5)
    game.move(game.player1, 6)
  end
  def winning_scenario3
    game.move(game.player1, 7)
    game.move(game.player1, 8)
    game.move(game.player1, 9)
  end
  def winning_scenario4
    game.move(game.player1, 1)
    game.move(game.player1, 4)
    game.move(game.player1, 7)
  end
  def winning_scenario5
    game.move(game.player1, 2)
    game.move(game.player1, 5)
    game.move(game.player1, 8)
  end
  def winning_scenario6
    game.move(game.player1, 3)
    game.move(game.player1, 6)
    game.move(game.player1, 9)
  end
  def winning_scenario7
    game.move(game.player1, 1)
    game.move(game.player1, 5)
    game.move(game.player1, 9)
  end
  def winning_scenario8
    game.move(game.player1, 3)
    game.move(game.player1, 5)
    game.move(game.player1, 7)
  end
end

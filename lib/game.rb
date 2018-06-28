require_relative './player.rb'
class Game

  attr_reader :board, :player1, :player2

  def initialize(player1, player2)
    @board = Array.new(9) { " " }
    @player1 = player1
    @player2 = player2
  end
  def move(player, position)
    if board[position - 1] == " "
      board[position - 1] = player.mark
    else
      raise 'hey, this field is taken'
    end
  end
end

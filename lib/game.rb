require_relative './player.rb'
class Game
  attr_reader :board, :player1, :player2
  attr_accessor :current_player

  def initialize(player1, player2)
    @board = Array.new(9) { ' ' }
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  def move(position, player = current_player)
    if board[position - 1] == ' '
      board[position - 1] = player.mark
    else
      raise 'hey, this field is taken'
    end
    player_swap
  end

  def game_over(player)
    if win?(player)
      "#{player.name} won"
    elsif board.include?(' ') == false
      'draw'
    else
      false
    end
  end

  def player_swap
    @current_player = if current_player == player1
                        player2
                      else
                        player1
                      end
  end

  private

  def win?(player)
    results = winning_scenarios.map { |scenario| check(scenario, player.mark) }
    results.include?(true)
  end

  def winning_scenarios
    [[board[0], board[1], board[2]], [board[3], board[4], board[5]], [board[6], board[7], board[8]], [board[0], board[3], board[6]], [board[2], board[5], board[8]], [board[1], board[4], board[7]], [board[0], board[4], board[8]], [board[2], board[4], board[6]]]
  end

  def check(arr, mark)
    arr.all? { |move| move == mark }
  end
end

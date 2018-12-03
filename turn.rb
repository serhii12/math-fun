# decide who makes a move first
class Turn
  attr_reader :current_player, :second_player
  def initialize(players)
    @players = players.shuffle
    @current_player = nil
    @second_player = nil
  end

  def who_is_current_player
    @players.first
  end

  def new_turn
    puts ""
    puts '------- NEW TURN -------'
    @current_player = who_is_current_player
    @second_player = who_is_second_player(@current_player)
    @players.rotate!
  end

  def who_is_second_player(current)
    @players.reject { |player| player == current }.sample
  end
end

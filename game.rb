# Game class
class Game
  def initialize
    @player1 = Player.new('Player 1')
    @player2 = Player.new('Player 2')
    @players = [@player1, @player2]
    @turn = Turn.new(@players)
  end

  def start_game
    puts 'Welcome to Math Game -_-'
    puts 'You will start with 3 lives'
    @turn.new_turn
    until game_over?
      current_player = @turn.current_player
      second_player = @turn.second_player

      # Create questions
      question = Newquestion.new
      puts "#{current_player.name}: #{question.generate_question}"
      print '> '
      answer = gets.chomp.to_i

      if question.check_answer(answer)
        puts "#{current_player.name}: YES! You are correct!"
      else
        current_player.lost_live
        puts "#{current_player.name}: Seriously!? No!"
      end

      @turn.new_turn
      summary
    end
    end_game
  end

  def summary
    # summary
    puts ""
    puts '----- Summary ----'
    puts @players.map(&:status).join("\n")
    puts '----- Summary ----'
    puts ""
  end

  def game_over?
    @players.any?(&:dead?)
  end

  def end_game
    winner = @players.reject(&:dead?).first
    loser = @players.select(&:dead?).first
    puts ""
    puts "#{loser.name} has lost"
    puts ""
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
    puts ""
    puts '======== GAME OVER ========'
    puts 'Good bye!'
  end
end

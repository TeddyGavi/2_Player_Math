require "./01_player.rb"
require "./02_question.rb"

# Create a new Game, get each players name, then start the game
# GAME_LOOP
  # Create a new Question, ask the question, and get the answer from that current player
  # If the answer is correct, confirm, and switch players 
    # Check if the current players lives are zero, end game if yes, if not switch players and restart game_loop
  # If the answer is incorrect, display an error and the correct answer, and...
    # check if the current players lives are zero, end game if yes, if not switch players and restart game_loop
# When game ends, display the winner!

class Game
  attr_accessor :player1, :player2, :current_player
  attr_reader :question
  def initialize
    @player1 = Player.new
    puts player1.player_name_is
    player1.name = gets.chomp.to_s
    @player2 = Player.new
    puts player2.player_name_is
    player2.name = gets.chomp.to_s

    @current_player = @player1

    self.start
  end

  private

  def switch_player(current_player)
    self.current_player = case current_player
                            when player1 then player2
                            when player2 then player1
                          end
  end

  def game_end
    switch_player(current_player)
    puts "Game over #{self.current_player.name} is the winner!     
    ----
    Thanks for playing!
    ----"
  end

  def game_loop
    question = Question.new
    
    puts question.ask
    input = gets.chomp.to_i

      if question.correct?(input) == true
        print "Great! #{current_player.name} "
       else 
        puts "Too bad, #{current_player.name} -------------------------------- the answer was #{question.answer}"
        current_player.lose_life
      end

      if current_player.lose? == true 
        self.game_end
      else
        switch_player(current_player)
        puts "Current lives: #{player1.name} with #{player1.lives} / 3 and #{player2.name} with #{player2.lives} / 3"
        puts "
---- 
Next Round
---- 
        GO! -> Player: #{current_player.name} 

----"
        game_loop
      end
  end


def start 
  puts "
  ----
  Welcome to the game, you each have 3 lives. Good luck! 
  ----

  #{current_player.name} goes first
  "
  game_loop
end

end

game = Game.new
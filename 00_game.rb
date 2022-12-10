require "./01_player.rb"
require "./02_question.rb"

class Game
  attr_accessor :player1, :player2, :current_player
  attr_reader :question
  def initialize
    puts "Player 1 is ...?"
    @player1 = Player.new
    puts "Player 2 is...?"
    @player2 = Player.new
    @current_player = @player1
  end

  def next_player(current_player)
    self.current_player = case current_player
                            when player1 then player2
                            when player2 then player1
                          end
  end

  def win
    next_player(current_player)
    puts "Game over #{self.current_player.name} is the winner!     
    ----
    Thanks for playing!
    ----"
  end

  def lose?(current_player)
    if current_player.lives == 0
      true
    else 
      false
    end
  end

  def game_loop
    question = Question.new

      if question.ask_question? == true
        puts "Great! #{current_player.name}"
       else 
        puts "Too bad! #{current_player.name}"
        current_player.lose_life
       end

      if lose?(current_player)
        self.win
      else
        next_player(current_player)
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
  Welcome to the game
  ----

  #{current_player.name} goes first
  "
  game_loop
end

end


game = Game.new
game.start
require "./01_player.rb"
require "./02_question.rb"

class Game
  attr_accessor :player1, :player2, :current_player
  attr_reader :question
  def initialize
    puts "Player 1 is ...?"
    name1 = gets.chomp.to_s
    @player1 = Player.new("#{name1}")
    puts "Player 2 is...?"
    name2 = gets.chomp.to_s
    @player2 = Player.new("#{name2}")
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

  def ask_question?(question) 
    answer = question.answer
    puts question.current_q

    input = gets.chomp.to_i

    if input == answer
      true
    else
      false
    end
  end

  def game_loop
    question = Question.new

      if self.ask_question?(question) == true
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

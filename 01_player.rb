class Player
attr_accessor :lives
attr_reader :name
  def initialize
    puts "enter your name?"
    input = gets.chomp.to_s
    @name = input
    @lives = 3 
  end
  
  def lose_life
    self.lives -= 1
  end
end
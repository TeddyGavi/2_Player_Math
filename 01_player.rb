class Player
attr_accessor :lives
attr_reader :name
  def initialize(n)
    @name = n
    @lives = 3 
  end
  
  def lose_life
    self.lives -= 1
  end
end
class Player
attr_writer :lives
  def initialize(name, lives)
    @name = name
    @lives = lives 
  end

  def lose_life
    self.lives -= 1
  end
end
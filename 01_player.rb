class Player
attr_accessor :lives, :name
@@num_of_players = 0
  def initialize
    @name = nil
    @lives = 3 
    @@num_of_players += 1
  end

  def player_name_is
    "Player #{@@num_of_players} name is..."
  end
  
  def lose_life
    self.lives -= 1
  end

  def lose?
    if self.lives == 0
      true
    else 
      false
    end
  end

end
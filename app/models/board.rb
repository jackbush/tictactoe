class Board < ActiveRecord::Base
  
  belongs_to :game

  has_many :boards_players
  has_many :players, through: :boards_players

end

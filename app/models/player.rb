class Player < ActiveRecord::Base

  has_many :boards_players
  has_many :boards, through: :boards_players
  
end

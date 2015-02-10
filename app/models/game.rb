class Game < ActiveRecord::Base

  has_many :tic_tac_toe_boards
  
end

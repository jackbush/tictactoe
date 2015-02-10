class TicTacToeMove < ActiveRecord::Base

  belongs_to :tic_tac_toe_board
  belongs_to :player
  
end

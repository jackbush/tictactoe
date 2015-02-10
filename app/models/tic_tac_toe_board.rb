class TicTacToeBoard < ActiveRecord::Base

  belongs_to :game

  # has_many :players

  accepts_nested_attributes_for :tic_tac_toe_moves, allow_destroy: true

end

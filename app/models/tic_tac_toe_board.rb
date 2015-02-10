class TicTacToeBoard < ActiveRecord::Base

  belongs_to :game

  has_many :tic_tac_toe_moves, dependent: :destroy
  has_many :players, through: :tic_tac_toe_moves

  accepts_nested_attributes_for :tic_tac_toe_moves, allow_destroy: true

end

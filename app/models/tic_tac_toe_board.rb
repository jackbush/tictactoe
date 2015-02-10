class TicTacToeBoard < ActiveRecord::Base

  belongs_to :game

  # has_many :players

  def self.board_turn(game, square)
    game.board[square] = 'X'
    game.board
  end

end

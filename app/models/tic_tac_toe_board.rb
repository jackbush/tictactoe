class TicTacToeBoard < ActiveRecord::Base

  belongs_to :game

  # has_many :players

  def self.board_update_x(game, square)
    game.board[square] = 'X'
    game.board
  end

  def self.board_update_o(game, square)
    game.board[square] = 'O'
    game.board
  end

  def self.computer_move(game)
    available_squares = Array.new
    available_squares << game.board
    available_squares.flatten!
    available_squares.delete('X')
    available_squares.delete('O')
    square = available_squares.sample.to_i
  end

  def self.play(game, user_square)
    game.board = self.board_update_x(game, user_square)
    game.p1_squares << user_square
    #check for winner
    #count if turn < 8 or if board contains numbers
    if p2_id == nil
      comp_square = self.computer_move(game)
      game.board = self.board_update_o(game, comp_square)
      game.p2_squares << comp_square
    # else
      #wait for p2 move
    end
      #check for winner
      #check if end
      game
    #else
    #draw
  end

end
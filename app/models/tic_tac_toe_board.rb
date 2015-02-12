class TicTacToeBoard < ActiveRecord::Base

  belongs_to :game
  belongs_to :a_player, :class_name => 'Player', :foreign_key => 'a_player'
  belongs_to :b_player, :class_name => 'Player', :foreign_key => 'b_player'

  @winning_combinations = [['0','1','2'],['3','4','5'],['6','7','8'],['0','3','6'],['1','4','7'],['2','5','8'],['0','4','8'],['2','4','6']]

  def self.available_squares(board)
    result = Array.new
    result << board
    result.flatten!
    result.delete('x')
    result.delete('o')
    result
  end

  def self.computer_move(board)
    self.available_squares(board).sample.to_i
  end

  def self.board_update_x(game, square)
    game.board[square] = 'x'
    game.board
  end

  def self.board_update_o(game, square)
    game.board[square] = 'o'
    game.board
  end

  def self.check_win(player_squares)
    result = Array.new
    @winning_combinations.each do |win|
      result << (win - player_squares).empty?
    end
    result.include? true
  end

  def self.check_draw(board)
    self.available_squares(board).empty?
  end

  def self.play(game, user_square)
    game.board = self.board_update_x(game, user_square)
    game.p1_squares << user_square.to_s
    game.finished = self.check_win(game.p1_squares) || self.check_draw(game.board)
    return game if game.finished == true
    # if p2_id == nil
      comp_square = self.computer_move(game.board)
      game.board = self.board_update_o(game, comp_square)
      game.p2_squares << comp_square.to_s
    # else
      #wait for p2 move
    # end
    game.finished = self.check_win(game.p2_squares) || self.check_draw(game.board)
    game
  end

end
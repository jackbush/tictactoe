class TicTacToeBoard < ActiveRecord::Base

  belongs_to :game

  # has_many :players

  @winning_combinations = [['0','1','2'],['3','4','5'],['6','7','8'],['0','3','6'],['1','4','7'],['2','5','8'],['0','4','8'],['2','4','6']]

  def self.board_update_x(game, square)
    game.board[square] = 'x'
    game.board
  end

  def self.board_update_o(game, square)
    game.board[square] = 'o'
    game.board
  end

  def self.computer_move(game)
    available_squares = Array.new
    available_squares << game.board
    available_squares.flatten!
    available_squares.delete('x')
    available_squares.delete('o')
    square = available_squares.sample.to_i
  end

  def self.check_win(player_squares)
    results = Array.new
    @winning_combinations.each do |win|
      results << (player_squares - win).empty?
    end
    results.include? true
  end

  def self.play(game, user_square)
    game.board = self.board_update_x(game, user_square)
    game.p1_squares << user_square
    if self.check_win(game.p1_squares) == true
      puts "p1 wins"
    else
      #count if turn < 8 or if board contains numbers
      # if p2_id == nil
        comp_square = self.computer_move(game)
        game.board = self.board_update_o(game, comp_square)
        game.p2_squares << comp_square
      # else
        #wait for p2 move
    end
      #check for winner
      #check if end
      game
    # else
    #else
    #draw
  end

end
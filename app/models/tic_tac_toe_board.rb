class TicTacToeBoard < ActiveRecord::Base

  belongs_to :game
  belongs_to :a_player, :class_name => 'Player', :foreign_key => 'a_player'
  belongs_to :b_player, :class_name => 'Player', :foreign_key => 'b_player'

  @winning_combinations = [['0','1','2'],['3','4','5'],['6','7','8'],['0','3','6'],['1','4','7'],['2','5','8'],['0','4','8'],['2','4','6']]
  @corners = ['0', '2', '6', '8']
  @diagonal1 = ['0', '8']
  @diagonal2 = ['2', '6']

  def self.available_squares(board)
    result = Array.new
    result << board
    result.flatten!
    result.delete('x')
    result.delete('o')
    result
  end

  def self.near_wins(player_squares, opponent_squares)
    #select winning combinations that do not include an opponent square
    available_wins = Array.new
    @winning_combinations.each do |win|
      if (win - opponent_squares).size == 3
        available_wins << win
      end
    end
    #work out how far from each winning solution the computer currently is
    paths = Array.new
    available_wins.each do |win|
      paths << (win - player_squares)
    end
    #select squares that would result in instant win
    moves = Array.new
    paths.each do |path|
      if path.size == 1
        moves << path.first.to_i
      end
    end
    #return array of winning moves
    moves
  end

  def self.computer_move_clever(board, computer_squares, opponent_squares, difficulty)
    available = self.available_squares(board)
    available_corners = @corners - opponent_squares
    #if user starts in a corner, take center
    if computer_squares.empty? && available_corners.size < 4
      return 4
    #if computer is one move from winning, make the move
    elsif self.near_wins(computer_squares, opponent_squares).size > 0
      return self.near_wins(computer_squares, opponent_squares).sample
    #if user is one move from winning, take the square they need
    elsif self.near_wins(opponent_squares, computer_squares).size > 0
      return self.near_wins(opponent_squares, computer_squares).sample
    #if hard, if opponent has diagonal corners
    elsif difficulty == 'HARD'
      if (opponent_squares - @diagonal1).empty? || (opponent_squares - @diagonal2).empty?
        possible = (['1','3','5','7'] - opponent_squares)
        return possible.sample.to_i
      end
    #if nobody is about to win, take a corner if there's one left
    elsif available_corners.size > 0
      return available_corners.sample.to_i
    #if nobody's about to win and there are no corners, go anywhere
    else
      return available.sample.to_i
    end
  end

  def self.computer_move_random(board)
    self.available_squares(board).sample.to_i
  end

  def self.board_update(game, square, char)
    game.board[square] = char
    game.board
  end

  def self.check_win(player_squares)
    result = Array.new
    @winning_combinations.each do |win|
      result << (win - player_squares).empty?
    end
    if result.include? true
      player_squares << 'w'
    end
    result.include? true
  end

  def self.check_draw(board)
    self.available_squares(board).empty?
  end

  def self.play(game, player_square)
    game.board = self.board_update(game, player_square, 'x')
    game.p1_squares << player_square.to_s
    game.finished = self.check_win(game.p1_squares) || self.check_draw(game.board)
    return game if game.finished == true

    if game.difficulty == 'EASY'
      comp_square = self.computer_move_random(game.board)
    else
      comp_square = self.computer_move_clever(game.board, game.p2_squares, game.p1_squares, game.difficulty)
    end

    game.board = self.board_update(game, comp_square, 'o')
    game.p2_squares << comp_square.to_s
    game.finished = self.check_win(game.p2_squares) || self.check_draw(game.board)
    game
  end

end
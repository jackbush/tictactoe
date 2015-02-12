class TicTacToeBoard < ActiveRecord::Base

  belongs_to :game
  belongs_to :a_player, :class_name => 'Player', :foreign_key => 'a_player'
  belongs_to :b_player, :class_name => 'Player', :foreign_key => 'b_player'

  @winning_combinations = [['0','1','2'],['3','4','5'],['6','7','8'],['0','3','6'],['1','4','7'],['2','5','8'],['0','4','8'],['2','4','6']]

  @corners = ['0', '2', '6', '8']

  def self.available_squares(board)
    result = Array.new
    result << board
    result.flatten!
    result.delete('x')
    result.delete('o')
    result
  end

  def self.near_wins(player_squares, opponent_squares)
    available_wins = Array.new
    @winning_combinations.each do |win|
      if (win - opponent_squares).size == 3
        available_wins << win
      end
    end
    paths = Array.new
    available_wins.each do |win|
      paths << (win - player_squares)
    end
    moves = Array.new
    paths.each do |path|
      if path.size == 1
        moves << path.first.to_i
      end
    end
    binding.pry
    moves
  end

  def self.computer_move(board, computer_squares, opponent_squares)
    # self.available_squares(board).sample.to_i
    available = self.available_squares(board)
    available_corners = @corners - opponent_squares
    if computer_squares.empty? && available_corners.size < 4
      return 4
    elsif self.near_wins(computer_squares, opponent_squares).size > 0
      return self.near_wins(computer_squares, opponent_squares).sample
    elsif available_corners.size > 0
      return available_corners.sample.to_i
    else
      return available.sample.to_i
    end
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
    if result.include? true
      player_squares << 'w'
    end
    result.include? true
  end

  def self.check_draw(board)
    self.available_squares(board).empty?
  end

  def self.play(game, player_square)
    game.board = self.board_update_x(game, player_square)
    game.p1_squares << player_square.to_s
    game.finished = self.check_win(game.p1_squares) || self.check_draw(game.board)
    return game if game.finished == true
    # if p2_id == nil
      comp_square = self.computer_move(game.board, game.p2_squares, game.p1_squares)
      game.board = self.board_update_o(game, comp_square)
      game.p2_squares << comp_square.to_s
    # else
      #wait for p2 move
    # end
    game.finished = self.check_win(game.p2_squares) || self.check_draw(game.board)
    game
  end

  def self.stats_update(player, squares)
    player.games_played += 1
      if squares.include? 'w'
        player.games_won += 1
      end
    player.save
  end

end
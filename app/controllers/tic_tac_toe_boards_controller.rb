class TicTacToeBoardsController < ApplicationController

  authorize_resource

  def index
    @game = TicTacToeBoard.new
  end

  def new
    @game = TicTacToeBoard.new
  end

  def create
    game = TicTacToeBoard.create
    game.board << 0 << 1 << 2 << 3 << 4 << 5 << 6 << 7 << 8
    game.a_player = current_player
    game.difficulty = params[:commit]
    game.save
    redirect_to edit_tic_tac_toe_board_path(game)
  end

  def edit
    @game = TicTacToeBoard.find(params[:id])
  end

  def update
    game = TicTacToeBoard.find(params[:id])
    square = params[:commit].to_i
    game = TicTacToeBoard.play(game, square)
    game.save

    if game.finished == true
      if game.a_player
        Player.stats_update(game.a_player, game.p1_squares)
      end
      Player.stats_update(game.b_player, game.p2_squares)
      redirect_to tic_tac_toe_board_path(game)
    else
      redirect_to edit_tic_tac_toe_board_path(game)
    end

  end

  def show
    @game = TicTacToeBoard.find(params[:id])
    TicTacToeBoard.mark_win(@game)
  end
  
end
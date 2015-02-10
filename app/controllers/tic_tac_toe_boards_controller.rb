class TicTacToeBoardsController < ApplicationController

  def index
    @game = TicTacToeBoard.new()
  end

  def new
    @game = TicTacToeBoard.new()
    # game between players initialized here
  end

  def create
    game = TicTacToeBoard.create
    game.board << 0 << 1 << 2 << 3 << 4 << 5 << 6 << 7 << 8
    game.save
    redirect_to edit_tic_tac_toe_board_path(game)
  end

  def edit
    @game = TicTacToeBoard.find(params[:id])
  end

  def update
    @game = TicTacToeBoard.find(params[:id])

    TicTacToeBoard.register_turn(game)


    game.save
  end

  def show
    @board = TicTacToeBoard.find(params[:id])
  end
  
end
class TicTacToeBoardsController < ApplicationController

  before_action :authenticate_player!
  authorize_resource

  def index
    @game = TicTacToeBoard.new
  end

  def new
    #new game with somebody
    @game = TicTacToeBoard.new
  end

  def create
    game = TicTacToeBoard.create
    game.board << 0 << 1 << 2 << 3 << 4 << 5 << 6 << 7 << 8
    game.a_player = 20
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
      redirect_to tic_tac_toe_board_path(game)
    else
      redirect_to edit_tic_tac_toe_board_path(game)
    end

  end

  def show
    @game = TicTacToeBoard.find(params[:id])
  end
  
end
class BoardsController < ApplicationController

  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = Board.new
  end

  def create
    Board.create(board_params)
    redirect_to boards_path
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])
    @board.update(board_params)
    redirect_to boards_path
  end

  def destroy
    Board.find(params[:id]).destroy
    redirect_to boards_path
  end

  private
  def board_params
    params.require(:board).permit(:game_id, {boards_players_attributes: [:player_id, :winner]})
  end
  
end
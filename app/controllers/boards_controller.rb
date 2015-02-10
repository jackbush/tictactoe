class BoardsController < ApplicationController

  def index
    #how to render a board vs computer here
    @board = Board.new
  end

  def show
    @board = Board.find(params[:id])
  end

  def new
    @board = Board.new
    # game goes here
    #can add players as arguments here, if model is modified
    #'finished' as a boolean value?
    #player one = current user
    #player two can take form of other user or computer, params?
  end

  def create
    #board can be kept in memory, only thing to be saved is a record for leaderboard/scoring
  end

  def update
    #is it necessary to put moves through here?
  end

  private
  def board_params
    params.require(:board).permit(:game_id, {boards_players_attributes: [:player_id, :winner]})
  end
  
end
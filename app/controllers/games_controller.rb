class GamesController < ApplicationController

  before_action :authenticate_player!
  authorize_resource

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    Game.create(game_params)
    redirect_to games_path
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)
    redirect_to games_path
  end

  def destroy
    Game.find(params[:id]).destroy
    redirect_to games_path
  end

  private
  def game_params
    params.require(:game).permit(:name, :instructions)
  end
  
end
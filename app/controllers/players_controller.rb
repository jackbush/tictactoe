class PlayersController < ApplicationController
  
  authorize_resource

  def leaderboard
    @lead_players = Player.all.order('games_won DESC')
  end

  def show
    @player = Player.find(params[:id])
  end
  
end
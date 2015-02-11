class PlayersController < ApplicationController
  
  before_action :authenticate_player!
  authorize_resource

  def leaderboard
    @lead_players = Player.all.order('games_won DESC')
  end
  
end
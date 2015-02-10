class PlayersController < ApplicationController
  def index
    @players = Player.all.order('games_won')
  end
end
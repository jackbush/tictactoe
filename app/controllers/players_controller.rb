class PlayersController < ApplicationController
  def leaderboard
    @players = Player.all.order('games_won DESC')
  end
end
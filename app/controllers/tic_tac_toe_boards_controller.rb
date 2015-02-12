class TicTacToeBoardsController < ApplicationController

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
    game.a_player = current_player
    game.save
    redirect_to edit_tic_tac_toe_board_path(game)
  end

  def edit
    @game = TicTacToeBoard.find(params[:id])
    @a_player_avatar = @game.a_player.gravatar_url
  end

  def update
    game = TicTacToeBoard.find(params[:id])
    square = params[:commit].to_i
    game = TicTacToeBoard.play(game, square)
    game.save

    if game.finished == true

      # TicTacToeBoard.status_update(game.a_player, game.p1_squares)
      # TicTacToeBoard.status_update(game.b_player, game.p2_squares)

      game.a_player.games_played += 1
      if game.p1_squares.include? 'w'
        game.a_player.games_won += 1
      end
      game.a_player.save

      game.b_player.games_played += 1
      if game.p2_squares.include? 'w'
        game.b_player.games_won += 1
      end
      game.b_player.save

      redirect_to tic_tac_toe_board_path(game)
    else
      redirect_to edit_tic_tac_toe_board_path(game)
    end

  end

  def show
    @game = TicTacToeBoard.find(params[:id])
    @a_player_avatar = @game.a_player.gravatar_url
  end
  
end
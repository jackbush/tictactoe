class RenameMatchIdInBoardsPlayers < ActiveRecord::Migration
  def change

    rename_column :boards_players, :match_id, :board_id

  end
end

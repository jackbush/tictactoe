class RestructureBoardsPlayerTable < ActiveRecord::Migration
  def change

    rename_column :boards_players, :winner_id, :player_id
    remove_column :boards_players, :loser_id
    add_column :boards_players, :winner, :binary

  end
end

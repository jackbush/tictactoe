class RenamePlayerIdsInBoard < ActiveRecord::Migration
  def change
    rename_column :tic_tac_toe_boards, :p1_id, :a_player
    rename_column :tic_tac_toe_boards, :p2_id, :b_player
  end
end

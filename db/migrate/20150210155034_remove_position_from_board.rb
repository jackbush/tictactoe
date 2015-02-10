class RemovePositionFromBoard < ActiveRecord::Migration
  def change
    remove_column :tic_tac_toe_boards, :p1_position
    remove_column :tic_tac_toe_boards, :p2_position
  end
end

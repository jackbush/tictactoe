class DropMovesTable < ActiveRecord::Migration
  def change
    drop_table :tic_tac_toe_moves
  end
end

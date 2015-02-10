class CreateTicTacToeMoves < ActiveRecord::Migration
  def change
    create_table :tic_tac_toe_moves do |t|
      t.integer :board_id
      t.integer :player_id
      t.integer :position

      t.timestamps null: false
    end
  end
end

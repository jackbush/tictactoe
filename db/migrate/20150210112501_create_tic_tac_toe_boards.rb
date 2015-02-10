class CreateTicTacToeBoards < ActiveRecord::Migration
  def change
    create_table :tic_tac_toe_boards do |t|
      t.integer :game_id
      t.integer :p1_id
      t.integer :p2_id
      t.integer :p1_position
      t.integer :p2_position
      t.boolean :finished

      t.timestamps null: false
    end
  end
end

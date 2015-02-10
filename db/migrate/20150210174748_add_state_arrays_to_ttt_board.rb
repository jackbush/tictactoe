class AddStateArraysToTttBoard < ActiveRecord::Migration
  def change
    add_column :tic_tac_toe_boards, :board, :string, array: true, default: [0,1,2,3,4,5,6,7,8]
    add_column :tic_tac_toe_boards, :p1_squares, :string, array: true, default: []
    add_column :tic_tac_toe_boards, :p2_squares, :string, array: true, default: []
  end
end

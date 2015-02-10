class RemoveBoardFromTicTacToeBoards < ActiveRecord::Migration
  def change
    remove_column :tic_tac_toe_boards, :board
  end
end

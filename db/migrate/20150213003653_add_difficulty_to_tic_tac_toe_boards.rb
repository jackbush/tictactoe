class AddDifficultyToTicTacToeBoards < ActiveRecord::Migration
  def change
    add_column :tic_tac_toe_boards, :difficulty, :string
  end
end

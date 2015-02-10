class AddBoardToTttBoards < ActiveRecord::Migration
  def change
    add_column :tic_tac_toe_boards, :board, :string, array: true, default: []
  end
end

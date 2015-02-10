class SetDefaultBoardToEmptyArray < ActiveRecord::Migration
  def change
    change_column :tic_tac_toe_boards, :board, :string, default: []
  end
end

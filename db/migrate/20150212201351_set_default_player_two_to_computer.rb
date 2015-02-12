class SetDefaultPlayerTwoToComputer < ActiveRecord::Migration
  def change
    change_column :tic_tac_toe_boards, :b_player, :integer, default: 2
  end
end

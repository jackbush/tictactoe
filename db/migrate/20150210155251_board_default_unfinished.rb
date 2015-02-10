class BoardDefaultUnfinished < ActiveRecord::Migration
  def change
    change_column :tic_tac_toe_boards, :finished, :boolean, :default => false
  end
end

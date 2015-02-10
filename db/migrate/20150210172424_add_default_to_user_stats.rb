class AddDefaultToUserStats < ActiveRecord::Migration
  def change
    change_column :players, :games_played, :integer, :default => 0
    change_column :players, :games_won, :integer, :default => 0
  end
end

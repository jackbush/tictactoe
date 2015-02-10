class AddInstructionsToGames < ActiveRecord::Migration
  def change
    add_column :games, :instructions, :text
  end
end

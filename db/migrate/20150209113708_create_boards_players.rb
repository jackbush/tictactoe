class CreateBoardsPlayers < ActiveRecord::Migration
  def change
    create_table :boards_players do |t|
      t.integer :match_id
      t.integer :winner_id
      t.integer :loser_id

      t.timestamps null: false
    end
  end
end

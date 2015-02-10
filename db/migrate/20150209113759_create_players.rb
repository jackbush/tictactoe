class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :username
      t.string :avatar
      t.integer :games_played
      t.integer :games_won

      t.timestamps null: false
    end
  end
end

class AddRoleToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :role, :string, default: "basic"
  end
end

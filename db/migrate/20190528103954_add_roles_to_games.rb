class AddRolesToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :roles, :string
  end
end

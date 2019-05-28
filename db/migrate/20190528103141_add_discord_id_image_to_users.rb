class AddDiscordIdImageToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :discord_id, :string
    add_column :users, :image, :string
  end
end

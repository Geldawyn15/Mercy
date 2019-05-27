class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.references :gamer, foreign_key: true
      t.references :friend, index: true, foreign_key: { to_table: :gamers }

      t.timestamps
    end
  end
end

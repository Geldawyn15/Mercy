class CreateGameGamerProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :game_gamer_profiles do |t|
      t.references :game, foreign_key: true
      t.references :gamer, foreign_key: true
      t.string :lancher_tag
      t.string :rank
      t.string :mainrole
      t.jsonb :profile
      t.jsonb :complete
      t.jsonb :mainhero

      t.timestamps
    end
  end
end

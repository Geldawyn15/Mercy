class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :spirit
      t.string :rank_scale
      t.integer :rating
      t.text :comment
      t.references :game_gamer_profile, foreign_key: true

      t.timestamps
    end
  end
end

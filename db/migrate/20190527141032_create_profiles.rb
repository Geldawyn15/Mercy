class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.references :game, foreign_key: true
      t.references :user, foreign_key: true
      t.string :lancher_tag
      t.string :rank
      t.string :mainrole
      t.jsonb :profile
      t.jsonb :complete
      t.jsonb :main_hero

      t.timestamps
    end
  end
end

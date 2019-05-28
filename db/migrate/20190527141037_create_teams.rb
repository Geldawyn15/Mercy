class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :spirit
      t.string :rank_scale
      t.string :status
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end

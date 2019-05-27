class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.string :rank_typology
      t.integer :players_quantity
      t.timestamps
    end
  end
end

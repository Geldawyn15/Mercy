class CreateGamers < ActiveRecord::Migration[5.2]
  def change
    create_table :gamers do |t|
      t.date :birth_date
      t.string :langage
      t.string :location

      t.timestamps
    end
  end
end

class CreateGamers < ActiveRecord::Migration[5.2]
  def change
    create_table :gamers do |t|
      t.string :username
      t.string :email
      t.date :birth_date
      t.string :langage
      t.string :location

      t.timestamps
    end
  end
end

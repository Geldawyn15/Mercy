class AddBirthdateLangageLocationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birthdate, :date
    add_column :users, :langage, :string
    add_column :users, :location, :string
  end
end

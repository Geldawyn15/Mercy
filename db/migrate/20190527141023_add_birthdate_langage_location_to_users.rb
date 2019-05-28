class AddBirthdateLangageLocationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :birthdate, :date, default: '25/12/1991'
    add_column :users, :langage, :string, default: 'en'
    add_column :users, :location, :string, default: 'eu'
  end
end

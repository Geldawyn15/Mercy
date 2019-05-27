class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :gamer, foreign_key: true
      t.references :team, foreign_key: true
      t.integer :rating
      t.text :comment
      t.boolean :add_friend
      t.boolean :endorse
      t.boolean :nok, default: false
      t.boolean :nok_positiveness
      t.boolean :nok_respect
      t.boolean :nok_communication
      t.boolean :nok_helpfulness

      t.timestamps
    end
  end
end

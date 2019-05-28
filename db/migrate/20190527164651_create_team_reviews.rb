class CreateTeamReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :team_reviews do |t|
      t.integer :rating
      t.text :comment
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end

class AddTeamToUserReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_reviews, :team, foreign_key: true
  end
end

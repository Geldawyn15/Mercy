class AddUserToTeamReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :team_reviews, :user, foreign_key: true
  end
end

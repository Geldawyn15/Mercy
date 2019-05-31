class AddUserReviewedtoUserReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_reviews, :user_reviewed, index: true, foreign_key: { to_table: :users }
  end
end

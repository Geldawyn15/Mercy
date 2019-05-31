class UserReview < ApplicationRecord
  belongs_to :user
  belongs_to :user_reviewed, class_name: 'User'
  validates :user, :user_reviewed, presence: true

  after_save :frienshipcreation

  private

  def frienshipcreation
    Friendship.create!(user: user, friend: user_reviewed) if add_friend == true
  end
end

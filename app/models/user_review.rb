class UserReview < ApplicationRecord
  belongs_to :user

  validates :user, :add_friend, :endorse, :nok, presence: true
end

class TeamReview < ApplicationRecord
  belongs_to :team
  belongs_to :user
  validates :rating, presence: true
end

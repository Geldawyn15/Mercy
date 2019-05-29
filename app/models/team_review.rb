class TeamReview < ApplicationRecord
  belongs_to :team
  validates :rating, presence: true
end

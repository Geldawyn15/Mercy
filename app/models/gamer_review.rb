class GamerReview < ApplicationRecord
  belongs_to :gamer

  validates :gamer, :add_friend, :endorse, :nok, presence: true
end

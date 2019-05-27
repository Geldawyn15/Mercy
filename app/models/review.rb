class Review < ApplicationRecord
  belongs_to :gamer
  belongs_to :team

  validates :gamer, :add_friend, :endorse, :nok, presence: true
end

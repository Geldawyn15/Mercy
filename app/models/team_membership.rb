class TeamMembership < ApplicationRecord
  belongs_to :gamer
  belongs_to :team

  validates :gamer, :team, presence: true
end

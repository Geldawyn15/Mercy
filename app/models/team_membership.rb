class TeamMembership < ApplicationRecord
  belongs_to :user
  belongs_to :team

  validates :user, :team, presence: true
end

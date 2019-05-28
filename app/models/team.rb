class Team < ApplicationRecord
  has_many :team_memberships
  has_many :team_reviews, dependent: :destroy
  has_many :users, through: :team_memberships
  belongs_to :game

  validates :spirit, :rank_scale, presence: true
  validates :status, inclusion: { in: %w[pending complete ingame over],
                                  message: "Status should be either 'pending' or 'complete'or ingame' or 'over'" }
end

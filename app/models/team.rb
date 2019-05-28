class Team < ApplicationRecord
  has_many :team_memberships
  has_many :reviews
  has_many :users, through: :team_memberships
  belongs_to :profile
  belongs_to :game, through: :profile

  validates :spirit, :rank_scale, presence: true
end

class Team < ApplicationRecord
  has_many :team_memberships
  has_many :gamers, through: :team_memberships
  belongs_to :game_gamer_profile
  belongs_to :game, through: :game_gamer_profile

  validates :spirit, :rank_scale, presence: true
end

class Gamer < ApplicationRecord
  has_many :game_gamer_profiles
  has_many :reviews
  has_many :team_membership
  has_many :teams, through: :team_memberships
  has_many :friendships
  has_many :friends, class_name: 'Gamer', through: :friendships

  validates :username, :email, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

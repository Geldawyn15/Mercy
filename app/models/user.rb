class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :profiles, dependent: :destroy
  has_many :user_reviews, dependent: :destroy
  has_many :team_membership
  has_many :teams, through: :team_memberships
  has_many :friendships, dependent: :destroy
  has_many :friends, class_name: 'User', through: :friendships

  validates :username, :location, presence: true
  validates :status, inclusion: { in: %w[online ingame away],
                                  message: "%{value} is not a valid status" }

  validates :gender, inclusion: { in: %w[male female fluid nc],
                                 message: "%{value} is not a valid gender" }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.user_for_game(game)
    Profile.where(game: game).map do |profile|
      User.find(profile.user_id)
    end
  end
end

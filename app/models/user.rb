class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :profiles, dependent: :destroy
  has_many :games, through: :profiles
  has_many :user_reviews, dependent: :destroy
  has_many :team_memberships
  has_many :teams, through: :team_memberships
  has_many :team_reviews
  has_many :friendships, dependent: :destroy
  has_many :friends, class_name: 'User', through: :friendships

  validates :username, :location, presence: true
  validates :status, inclusion: { in: %w[online ingame away],
                                  message: "%{value} is not a valid status" }

  validates :gender, inclusion: { in: %w[male female fluid nc],
                                  message: "%{value} is not a valid gender" }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.user_for_game_available(game)
    Profile.where(game: game).map do |profile|
      user = User.find(profile.user_id)
      if user.user_already_booked
        nil
      else
        user
      end
    end.compact
  end

  def self.user_for_game(game)
    Profile.where(game: game).map do |profile|
      user = User.find(profile.user_id)
    end.compact
  end

  def user_already_booked
    teams.where(status: "pending").any? || teams.where(status: "complete").any? || teams.where(status: "ingame").any?
  end

  def profile(team)
    profile = profiles.where(game: team.game)
    profile.first.mainrole
  end

  def shared_team_count(friend)
    teams.where(id: friend.teams.pluck(:id)).count
  end

  def game_profile(game)
    profile = Profile.where(user: self, game: game)
    if
      profile != []
      profile[0].mainrole
    else
      nil
    end
  end

  def age
    now = Time.now.utc.to_date
    now.year - self.birthdate.year - ((now.month > self.birthdate.month || (now.month == self.birthdate.month && now.day >= self.birthdate.day)) ? 0 : 1)
  end
end

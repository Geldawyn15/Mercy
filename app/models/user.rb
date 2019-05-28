class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :profiles, dependent: :destroy
  has_many :user_reviews, dependent: :destroy
  has_many :team_membership
  has_many :teams, through: :team_memberships
  has_many :friendships, dependent: :destroy
  has_many :friends, class_name: 'User', through: :friendships

  validates :username, :email, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

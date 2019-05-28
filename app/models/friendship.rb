class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friends, class_name: 'User', foreign_key: 'friend_id'

  validates :user, :friend, presence: true
end

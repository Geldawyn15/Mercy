class Friendship < ApplicationRecord
  belongs_to :gamer
  belongs_to :friends, class_name: 'Gamer', foreign_key: 'friend_id'

  validates :gamer, :friend, presence: true
end

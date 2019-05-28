class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :teams

  validates :game, :user, :main_role, :rank, :launcher_tag, presence: true
end

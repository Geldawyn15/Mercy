class Profile < ApplicationRecord
  belongs_to :user
  belongs_to :game

  validates :game, :user, :mainrole, :launcher_tag, presence: true
end

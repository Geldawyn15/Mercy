class GameGamerProfile < ApplicationRecord
  belongs_to :gamer
  belongs_to :game
  has_many :teams

  validates :game, :gamer, :main_role, :rank, :launcher_tag, presence: true
end

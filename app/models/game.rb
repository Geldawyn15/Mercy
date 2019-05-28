class Game < ApplicationRecord
  has_many :profiles
  has_many :teams

  validates :name, :rank_typology, :players_quantity, presence: true
end

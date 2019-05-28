class Game < ApplicationRecord
  has_many :profiles

  validates :name, :rank_typology, players_quantity, presence: true
end

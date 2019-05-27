class Game < ApplicationRecord
  has_many :game_gamer_profiles

  validates :name, :rank_typology, players_quantity, presence: :true
end

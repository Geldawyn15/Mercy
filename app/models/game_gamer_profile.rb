class GameGamerProfile < ApplicationRecord
  belongs_to :game
  belongs_to :gamer
end

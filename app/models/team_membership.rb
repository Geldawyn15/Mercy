class TeamMembership < ApplicationRecord
  belongs_to :gamer
  belongs_to :team
end

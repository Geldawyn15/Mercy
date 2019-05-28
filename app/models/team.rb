class Team < ApplicationRecord
  has_many :team_memberships
  has_many :team_reviews, dependent: :destroy
  has_many :users, through: :team_memberships
  belongs_to :game

  validates :spirit, :rank_scale, presence: true
  validates :status, inclusion: { in: %w[pending complete ingame over],
                                  message: "Status should be either 'pending' or 'complete'or ingame' or 'over'" }

  def team_users
    @team.team_memberships.map do |team_membership|
      team_membership.user
    end
  end

  def self.all_pending
    Team.where(status: 'pending')
  end

  def pending?
    @team.status == "pending"
  end

  def pending!
    @team.status = "pending"
    team.save!
  end

  def self.all_complete
    Team.where(status: 'complete')
  end

  def complete?
    @team.status == "complete"
  end

  def complete!
    @team.status = "complete"
    team.save!
  end

  def self.all_ingame
    Team.where(status: 'ingame')
  end

  def ingame?
    @team.status == "ingame"
  end

  def ingame!
    @team.status = "ingame"
    team.save!
  end

  def self.all_over
    Team.where(status: 'over')
  end

  def over?
    @team.status == "over"
  end

  def over!
    @team.status = "over"
    team.save!
  end
end

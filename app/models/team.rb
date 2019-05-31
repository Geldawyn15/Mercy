class Team < ApplicationRecord
  has_many :team_memberships
  has_many :team_reviews, dependent: :destroy
  has_many :users, through: :team_memberships
  belongs_to :game

  validates :spirit, :rank_scale, presence: true
  validates :status, inclusion: { in: %w[pending complete ingame over],
                                  message: "Status should be either 'pending' or 'complete'or ingame' or 'over'" }

  def average_rating
    unless team_reviews.count.zero?
      sum = 0
      team_reviews.each do |review|
        sum += review.rating
      end
      sum / team_reviews.count
    end
  end

  def complete_reviews?
    team_reviews.count != 6
  end

  def pending_reviews?
    team_reviews.count != 6
  end

  def self.no_reviews?
    Team.all.map { |team| team.id if team.team_reviews.count == 0 }
  end

  def team_review_for(user)
    team_reviews.where(user: user)
  end

  def self.all_pending
    Team.where(status: 'pending')
  end

  def pending?
    @status == "pending"
  end

  def pending!
    @status = "pending"
    @team.save!
  end

  def self.all_complete
    Team.where(status: 'complete')
  end

  def complete?
    @status == "complete"
  end

  def complete!
    @status = "complete"
    @team.save!
  end

  def self.all_ingame
    Team.where(status: 'ingame')
  end

  def ingame?
    @status == "ingame"
  end

  def ingame!
    @status = "ingame"
    @team.save!
  end

  def self.all_over
    Team.where(status: 'over')
  end

  def over?
    @status == "over"
  end

  def over!
    @status = "over"
    @team.save!
  end
end

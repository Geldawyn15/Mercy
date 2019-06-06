class TeamReviewsController < ApplicationController
  before_action :set_team, only: %i[new create]
  skip_before_action :verify_authenticity_token, only: %i[create]

  def new
    @team_review = TeamReview.new
  end

  def create
    @team_review = TeamReview.new(team_review_params)
    @team_review.user_id = current_user.id
    @team_review.team = @team
    if @team_review.save!
      head :ok
    else
      head :bad_request
    end
  end

  private

  def team_review_params
    params.require(:team_review).permit(:rating, :comment)
  end

  def set_team
    @team = Team.find(params[:team_id])
  end
end

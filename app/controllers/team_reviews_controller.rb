class TeamReviewsController < ApplicationController
  before_action :set_team, only: %i[new create]

  def new
    @team_review = TeamReview.new
  end

  def create
    @team_review = TeamReview.new(team_review_params)
    @team_review.user_id = current_user.id
    @team_review.rating = 5
    @team_review.team = @team
    if @team_review.save!
      redirect_to user_path(current_user)
    else
      render 'new'
    end
  end

  private

  def team_review_params
    params.require(:team_review).permit(:team_id, :rating, :comment)
  end

  def set_team
    @team = Team.find(params[:team_id])
  end
end

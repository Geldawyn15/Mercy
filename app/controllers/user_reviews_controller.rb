class UserReviewsController < ApplicationController
  def new
    @review = UserReview.new
  end

  def create
    set_team
    @review = UserReview.new(review_params)
    @review.user_id = current_user.id
    @review.team_id = @team.id
    @review.save!
    redirect_to team_review_path(@team.id)
  end

  private

  def review_params
    params.require(:user_review).permit(:user, :user_reviewed_id, :endorse, :add_friend, :nok)
  end

  def set_team
    @team = Team.find(params[:team_id])
  end
end

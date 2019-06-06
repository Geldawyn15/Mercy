class UserReviewsController < ApplicationController
  before_action :set_team, only: %i[create]
  skip_before_action :verify_authenticity_token, only: %i[create]

  def new
    @review = UserReview.new
  end

  def create
    review = UserReview.new(review_params)
    review.user_id = current_user.id
    review.team_id = @team.id
    if review.save!
      if review.add_friend
        Friendship.create(user_id: current_user.id, friend_id: review.user_reviewed_id)
      end
      head :ok
    else
      head :bad_request
    end
  end

  private

  def review_params
    params.require(:user_review).permit(:user_reviewed_id, :endorse, :add_friend,
                                        :nok, :nok_positiveness, :nok_respect,
                                        :nok_communication, :nok_helpfulness)
  end

  def set_team
    @team = Team.find(params[:team_id])
  end
end

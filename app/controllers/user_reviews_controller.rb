class UserReviewsController < ApplicationController
  def new
    @review = UserReview.new
  end

  def create
    @review = UserReview.new(review_params)
    if @review.save!
      redirect_to redirect_to users_path(@users.id)
    else
      render :new
    end
  end

  private

  def review_params
    if :nok == true
      params.require(:user_reviews).permit(:nok_positiveness, :nok_respect, :nok_helpfulness, :nok_communication)
    else
      params.require(:user_reviews).permit(:endorse, :add_friend)
    end
  end
end

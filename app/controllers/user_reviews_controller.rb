class UserReviewsController < ApplicationController
  def new
    @review = UserReview.new
  end

  def create
    @review = UserReview.new(params_review)
    if @review.save!
      redirect_to user_profiles_path(@users)
    else
      render :new
    end
  end

  private

  def params_review
    if :nok == true
      params.require(:user_reviews).permit(:nok_positiveness, :nok_respect, :nok_helpfulness, :nok_communication)
    else
      params.require(:user_reviews).permit(:endorse, :add_friend)
    end
  end
end

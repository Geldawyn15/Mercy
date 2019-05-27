require 'test_helper'

class GamerReviewsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get gamer_reviews_show_url
    assert_response :success
  end

end

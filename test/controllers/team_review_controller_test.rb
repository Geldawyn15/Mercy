require 'test_helper'

class TeamReviewControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get team_review_new_url
    assert_response :success
  end

end

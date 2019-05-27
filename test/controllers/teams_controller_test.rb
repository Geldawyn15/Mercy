require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get teams_new_url
    assert_response :success
  end

  test "should get show" do
    get teams_show_url
    assert_response :success
  end

end

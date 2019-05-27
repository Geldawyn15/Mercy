require 'test_helper'

class GameGamerProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get game_gamer_profiles_show_url
    assert_response :success
  end

end

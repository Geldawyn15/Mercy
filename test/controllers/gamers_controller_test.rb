require 'test_helper'

class GamersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get gamers_show_url
    assert_response :success
  end

end

require 'test_helper'

class FriendshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get friendships_index_url
    assert_response :success
  end

end

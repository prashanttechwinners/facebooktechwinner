require "test_helper"

class FriendControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get friend_new_url
    assert_response :success
  end

  test "should get edit" do
    get friend_edit_url
    assert_response :success
  end
end

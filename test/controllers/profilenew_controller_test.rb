require "test_helper"

class ProfilenewControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get profilenew_edit_url
    assert_response :success
  end
end

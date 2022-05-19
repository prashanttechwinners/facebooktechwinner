require "test_helper"

class ImageControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get image_new_url
    assert_response :success
  end

  test "should get edit" do
    get image_edit_url
    assert_response :success
  end
end

require 'test_helper'

class PasswordResetsControllerTest < ActionDispatch::IntegrationTest
  test "should get nnew" do
    get password_resets_nnew_url
    assert_response :success
  end

  test "should get edit" do
    get password_resets_edit_url
    assert_response :success
  end

end

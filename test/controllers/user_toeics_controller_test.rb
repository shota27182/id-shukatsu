require 'test_helper'

class UserToeicsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_toeics_index_url
    assert_response :success
  end

end

require 'test_helper'

class UserProgrammingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_programmings_index_url
    assert_response :success
  end

end

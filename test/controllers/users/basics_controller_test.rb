require 'test_helper'

class Users::BasicsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_basics_index_url
    assert_response :success
  end

end

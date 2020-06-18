require 'test_helper'

class Users::CoresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_cores_index_url
    assert_response :success
  end

end

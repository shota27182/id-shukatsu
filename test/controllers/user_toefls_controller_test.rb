require 'test_helper'

class UserToeflsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_toefls_index_url
    assert_response :success
  end

end

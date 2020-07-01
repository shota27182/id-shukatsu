require 'test_helper'

class UserEikensControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_eikens_index_url
    assert_response :success
  end

end

require 'test_helper'

class Mypage::AccountControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mypage_account_index_url
    assert_response :success
  end

end

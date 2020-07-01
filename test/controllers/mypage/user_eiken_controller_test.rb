require 'test_helper'

class Mypage::UserEikenControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mypage_user_eiken_index_url
    assert_response :success
  end

end

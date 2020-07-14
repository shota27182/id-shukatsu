require 'test_helper'

class Mypage::NotificationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mypage_notifications_index_url
    assert_response :success
  end

end

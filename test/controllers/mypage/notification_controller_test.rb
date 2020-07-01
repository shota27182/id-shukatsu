require 'test_helper'

class Mypage::NotificationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mypage_notification_index_url
    assert_response :success
  end

end

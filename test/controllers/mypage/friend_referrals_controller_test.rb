require 'test_helper'

class Mypage::FriendReferralsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get mypage_friend_referrals_new_url
    assert_response :success
  end

end

require 'test_helper'

class PartnerUser::SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get partner_user_sessions_new_url
    assert_response :success
  end

end

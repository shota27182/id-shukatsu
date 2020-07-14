require 'test_helper'

class Mypage::DeactivationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mypage_deactivation_index_url
    assert_response :success
  end

end

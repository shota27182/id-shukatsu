require 'test_helper'

class Mypage::NortificationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mypage_nortification_index_url
    assert_response :success
  end

  test "should get show" do
    get mypage_nortification_show_url
    assert_response :success
  end

end

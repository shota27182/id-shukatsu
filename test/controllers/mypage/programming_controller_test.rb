require 'test_helper'

class Mypage::ProgrammingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mypage_programming_index_url
    assert_response :success
  end

end

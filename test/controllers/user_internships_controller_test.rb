require 'test_helper'

class UserInternshipsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_internships_index_url
    assert_response :success
  end

end

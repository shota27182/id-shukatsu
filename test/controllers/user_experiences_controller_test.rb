require 'test_helper'

class UserExperiencesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_experiences_index_url
    assert_response :success
  end

end

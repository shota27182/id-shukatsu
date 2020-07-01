require 'test_helper'

class UserLanguagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_languages_index_url
    assert_response :success
  end

end

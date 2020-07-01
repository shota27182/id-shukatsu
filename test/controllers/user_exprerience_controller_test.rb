require 'test_helper'

class UserExprerienceControllerTest < ActionDispatch::IntegrationTest
  test "should get user:references" do
    get user_exprerience_user:references_url
    assert_response :success
  end

  test "should get experience:text" do
    get user_exprerience_experience:text_url
    assert_response :success
  end

end

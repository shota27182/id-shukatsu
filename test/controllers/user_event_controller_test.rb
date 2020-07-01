require 'test_helper'

class UserEventControllerTest < ActionDispatch::IntegrationTest
  test "should get user:references" do
    get user_event_user:references_url
    assert_response :success
  end

  test "should get event:references" do
    get user_event_event:references_url
    assert_response :success
  end

  test "should get event_schedule:references" do
    get user_event_event_schedule:references_url
    assert_response :success
  end

end

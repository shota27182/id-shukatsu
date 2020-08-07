require 'test_helper'

class AdminPage::EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_page_events_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_page_events_new_url
    assert_response :success
  end

end

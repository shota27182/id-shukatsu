require 'test_helper'

class PartnerPage::EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get partner_page_events_edit_url
    assert_response :success
  end

end

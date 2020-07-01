require 'test_helper'

class PartnerPage::EventControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get partner_page_event_index_url
    assert_response :success
  end

end

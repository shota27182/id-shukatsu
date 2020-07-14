require 'test_helper'

class PartnerPage::EditEventControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get partner_page_edit_event_index_url
    assert_response :success
  end

end

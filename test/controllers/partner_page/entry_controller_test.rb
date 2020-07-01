require 'test_helper'

class PartnerPage::EntryControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get partner_page_entry_new_url
    assert_response :success
  end

end

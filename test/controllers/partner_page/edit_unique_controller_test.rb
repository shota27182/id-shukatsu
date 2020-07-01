require 'test_helper'

class PartnerPage::EditUniqueControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get partner_page_edit_unique_index_url
    assert_response :success
  end

end

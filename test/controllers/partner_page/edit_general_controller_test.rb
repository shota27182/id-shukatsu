require 'test_helper'

class PartnerPage::EditGeneralControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get partner_page_edit_general_index_url
    assert_response :success
  end

end

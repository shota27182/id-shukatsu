require 'test_helper'

class PartnerPage::ApplyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get partner_page_apply_index_url
    assert_response :success
  end

end

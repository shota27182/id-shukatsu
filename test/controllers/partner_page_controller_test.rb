require 'test_helper'

class PartnerPageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get partner_page_index_url
    assert_response :success
  end

end

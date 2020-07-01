require 'test_helper'

class PartnerPage::SeminarControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get partner_page_seminar_new_url
    assert_response :success
  end

end

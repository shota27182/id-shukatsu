require 'test_helper'

class PartnerPage::InternshipControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get partner_page_internship_new_url
    assert_response :success
  end

end

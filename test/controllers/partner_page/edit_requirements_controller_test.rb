require 'test_helper'

class PartnerPage::EditRequirementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get partner_page_edit_requirements_index_url
    assert_response :success
  end

end

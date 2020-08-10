require 'test_helper'

class AdminPage::EditGeneralControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_page_edit_general_index_url
    assert_response :success
  end

end

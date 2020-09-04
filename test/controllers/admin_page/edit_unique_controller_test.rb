require 'test_helper'

class AdminPage::EditUniqueControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_page_edit_unique_index_url
    assert_response :success
  end

end

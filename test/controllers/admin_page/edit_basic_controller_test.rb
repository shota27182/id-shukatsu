require 'test_helper'

class AdminPage::EditBasicControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_page_edit_basic_index_url
    assert_response :success
  end

end

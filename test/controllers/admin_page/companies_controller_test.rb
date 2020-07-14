require 'test_helper'

class AdminPage::CompaniesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_page_companies_new_url
    assert_response :success
  end

  test "should get edit" do
    get admin_page_companies_edit_url
    assert_response :success
  end

  test "should get index" do
    get admin_page_companies_index_url
    assert_response :success
  end

end

require 'test_helper'

class AdminPage::ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_page_articles_new_url
    assert_response :success
  end

end

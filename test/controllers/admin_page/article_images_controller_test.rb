require 'test_helper'

class AdminPage::ArticleImagesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admin_page_article_images_create_url
    assert_response :success
  end

end

require 'test_helper'

class AdminPage::JobPrepareControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_page_job_prepare_index_url
    assert_response :success
  end

end

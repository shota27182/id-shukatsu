require 'test_helper'

class EditMailControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get edit_mail_index_url
    assert_response :success
  end

end

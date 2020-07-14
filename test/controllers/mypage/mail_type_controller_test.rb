require 'test_helper'

class Mypage::MailTypeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mypage_mail_type_index_url
    assert_response :success
  end

end

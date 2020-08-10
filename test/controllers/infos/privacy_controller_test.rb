require 'test_helper'

class Infos::PrivacyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get infos_privacy_index_url
    assert_response :success
  end

end

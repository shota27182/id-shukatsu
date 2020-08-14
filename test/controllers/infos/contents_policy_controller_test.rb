require 'test_helper'

class Infos::ContentsPolicyControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get infos_contents_policy_index_url
    assert_response :success
  end

end

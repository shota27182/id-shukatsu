require 'test_helper'

class SpecialLinkControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get special_link_index_url
    assert_response :success
  end

end

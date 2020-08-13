require 'test_helper'

class Infos::TermsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get infos_terms_index_url
    assert_response :success
  end

end

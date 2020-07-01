require 'test_helper'

class CompanyEventControllerTest < ActionDispatch::IntegrationTest
  test "should get company:references" do
    get company_event_company:references_url
    assert_response :success
  end

  test "should get event:references" do
    get company_event_event:references_url
    assert_response :success
  end

end

require 'test_helper'

class LogoutControllerTest < ActionDispatch::IntegrationTest
  test "should redirect to logout url" do
    get logout_url
    assert_response 302
  end
end

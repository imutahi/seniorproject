require 'test_helper'

class Auth0ControllerTest < ActionDispatch::IntegrationTest

  test "should redirect valid auth0 login to firms page" do
    get auth_auth0_callback_url
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:auth0]
    assert_redirected_to root_path
  end

  test "should redirect invalid auth0 login to auth0 failure" do
    get auth_failure_url
    assert_redirected_to root_path
  end

end

require 'test_helper'

class Auth0ControllerTest < ActionDispatch::IntegrationTest

  test "should redirect valid auth0 login to firms page" do
    #setup omniauth stub
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:auth0] = {
      "provider"=> "auth0",
      "uid"=> "google-oauth2|112708417615905138350",
      "info"=> {
        "email"=> "talontest7@gmail.com",
        "name"=> "Talon Test"
      },
      "credentials" => {
        "token" => "XWeawFFgIvBKi2TuhCm1blt_OPngjEKu",
        "refresh_token" => nil,
        "expires_at" => 1613871385
      },
    }

    get auth_auth0_callback_url
    assert_response 302
  end

  test "should redirect invalid auth0 login to auth0#failure" do
    get auth_failure_url
    assert_response 302
  end

end

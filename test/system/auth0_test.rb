require "application_system_test_case"

class Auth0Test < ApplicationSystemTestCase

  test "login" do
    visit root_url
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
    click_on "My Login"
  end

  test "logout" do
    visit home_index_url
    click_on "Logout"
  end

  test "login failure" do
    visit root_url
    OmniAuth.config.test_mode = true
    OmniAuth.config.on_failure = Proc.new { |env|
      OmniAuth::FailureEndpoint.new(env).redirect_to_failure
    }
    OmniAuth.config.mock_auth[:auth0] = :invalid_credentials
    click_on "My Login"
  end

  test "should visit auth_failure redirect and find Welcome text" do
    visit auth_failure_url
    assert_text /Welcome/
  end

end
require 'simplecov'
SimpleCov.start 'rails'
Rails.application.eager_load!

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: 1)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  OmniAuth.config.test_mode = true

  def sign_in_user
    OmniAuth.config.mock_auth[:auth0] = OmniAuth::AuthHash.new({
      :provider => 'auth0',
      :uid => 'google-oauth2|113828971320495757925',
      :info => {
        :name => "W Remos",
        :nickname => "wizard239",
        :email => "wizard239@gmail.com"
      }
    })
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:auth0]
    #puts(Rails.application.env_config["omniauth.auth"])
    get auth_auth0_callback_path
    #puts(session[:userinfo])
    #puts(session[:userinfo].present?)
  end

  def sign_in_system
    visit root_url
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:auth0] = OmniAuth::AuthHash.new({
      :provider => 'auth0',
      :uid => 'google-oauth2|113828971320495757925',
      :info => {
        :name => "W Remos",
        :nickname => "wizard239",
        :email => "wizard239@gmail.com"
      }
    })
    Rails.application.env_config["omniauth.auth"]  = OmniAuth.config.mock_auth[:auth0]
    click_on("Login", match: :first)
    #puts(session[:userinfo])
    #puts(session[:userinfo].present?)
  end
end

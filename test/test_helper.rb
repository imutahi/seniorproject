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

  Capybara.server_port = 33913

  # Add more helper methods to be used by all tests here...
  OmniAuth.config.test_mode = true

  def sign_in_user_admin
    OmniAuth.config.mock_auth[:auth0] = OmniAuth::AuthHash.new({
      :provider => 'auth0',
      :uid => 'google-oauth2|113828971320495757925',
      :info => {
        :name => "W Remos",
        :first_name => "Warren",
        :nickname => "wizard239",
        :email => "talontest7@gmail.com"
      },
      :extra => {
        :raw_info => {
          :given_name => "Warren"
        }
      }
    })
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:auth0]
    #puts(Rails.application.env_config["omniauth.auth"])
    get auth_auth0_callback_path
    #puts(session[:userinfo])
    #puts(session[:userinfo].present?)
  end

  def sign_in_normal_user
    OmniAuth.config.mock_auth[:auth0] = OmniAuth::AuthHash.new({
      :provider => 'auth0',
      :uid => 'google-oauth2|113828971320495757925',
      :info => {
        :name => "test",
        :first_name => "test",
        :nickname => "test",
        :email => "test@test.com"
      },
      :extra => {
        :raw_info => {
          :given_name => "test"
        }
      }
    })
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:auth0]
    get auth_auth0_callback_path
  end

  # used for controller test
  def sign_in_user_without_client_application
    OmniAuth.config.mock_auth[:auth0] = OmniAuth::AuthHash.new({
      :provider => 'auth0',
      :uid => 'google-oauth2|113828971320495757925',
      :info => {
        :name => "Hugo Meyer",
        :first_name => "Hugo",
        :nickname => "Hue",
        :email => "hugo@test.com"
      },
      :extra => {
        :raw_info => {
          :given_name => "hugo"
        }
      }
    })
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:auth0]
    get auth_auth0_callback_path
  end

  def sign_in_user_without_client_application_for_update
    OmniAuth.config.mock_auth[:auth0] = OmniAuth::AuthHash.new({
      :provider => 'auth0',
      :uid => 'google-oauth2|113828971320495757925',
      :info => {
        :name => "Willy Wonka",
        :first_name => "Willy",
        :nickname => "Will",
        :email => "willywonka@test.com"
      },
      :extra => {
        :raw_info => {
          :given_name => "will"
        }
      }
    })
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:auth0]
    get auth_auth0_callback_path
  end

  def sign_in_system_admin
    visit root_url
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:auth0] = OmniAuth::AuthHash.new({
      :provider => 'auth0',
      :uid => 'google-oauth2|113828971320495757925',
      :info => {
        :name => "W Remos",
        :first_name => "Warren",
        :nickname => "wizard239",
        :email => "talontest7@gmail.com"
      },
      :extra => {
        :raw_info => {
          :given_name => "Warren"
        }
      }
    })
    Rails.application.env_config["omniauth.auth"]  = OmniAuth.config.mock_auth[:auth0]
    click_on("Login", match: :first)
    #puts(session[:userinfo])
    #puts(session[:userinfo].present?)
  end

  def sign_in_system_normal
    visit root_url
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:auth0] = OmniAuth::AuthHash.new({
      :provider => 'auth0',
      :uid => 'google-oauth2|113828971320495757925',
      :info => {
        :name => "test testing",
        :first_name => "test",
        :nickname => "test",
        :email => "test@test.com"
      },
      :extra => {
        :raw_info => {
          :given_name => "test"
        }
      }
    })
    Rails.application.env_config["omniauth.auth"]  = OmniAuth.config.mock_auth[:auth0]
    click_on("Login", match: :first)
    #puts(session[:userinfo])
    #puts(session[:userinfo].present?)
  end

  def sign_in_system_normal_without_client_application
    visit root_url
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:auth0] = OmniAuth::AuthHash.new({
      :provider => 'auth0',
      :uid => 'google-oauth2|113828971320495757925',
      :info => {
        :name => "test testing",
        :first_name => "test",
        :nickname => "test",
        :email => "noemail@test.com"
      },
      :extra => {
        :raw_info => {
          :given_name => "test"
        }
      }
    })
    Rails.application.env_config["omniauth.auth"]  = OmniAuth.config.mock_auth[:auth0]
    click_on("Login", match: :first)
    #puts(session[:userinfo])
    #puts(session[:userinfo].present?)
  end
end

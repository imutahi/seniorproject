Rails.application.config.middleware.use OmniAuth::Builder do
    provider(
      :auth0,
      Rails.application.credentials.development[:auth0][:auth0_client_id],
      Rails.application.credentials.development[:auth0][:auth0_client_secret],
      Rails.application.credentials.development[:auth0][:auth0_domain],
      callback_path: '/auth/auth0/callback',
      authorize_params: {
        scope: 'openid email profile'
      }
    )
end
Rails.application.config.middleware.use OmniAuth::Builder do
  credentials = Rails.application.credentials
  provider :github, credentials.dig(:github, :client_id), credentials.dig(:github, :client_secret)
end

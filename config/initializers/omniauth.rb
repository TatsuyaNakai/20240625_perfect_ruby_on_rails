Rails.application.config.middleware.use OmniAuth::Builder do
  credentials = Rails.application.credentials
  provider :github, credentials.github[:client_id], credentials.github[:client_secret]
end

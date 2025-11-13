# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin Ajax requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    if Rails.env.development?
      # Allow development origins
      origins 'localhost:3000', '127.0.0.1:3000', /\Ahttp:\/\/localhost:\d+\z/, /\Ahttp:\/\/127\.0\.0\.1:\d+\z/
    elsif Rails.env.production?
      # Production origins should be set via ALLOWED_ORIGINS env var
      origins ENV.fetch("ALLOWED_ORIGINS", "").split(",").map(&:strip)
    else
      # Test environment
      origins '*'
    end

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      expose: ['Authorization'],
      credentials: true
  end
end

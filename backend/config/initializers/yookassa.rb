# YooKassa payment provider configuration
# Documentation: https://yookassa.ru/developers/

if defined?(Yookassa)
  Yookassa.configure do |config|
    # Shop credentials from environment variables
    config.shop_id = ENV['YOOKASSA_SHOP_ID']
    config.secret_key = ENV['YOOKASSA_SECRET_KEY']

    # Optional: set timeout for API requests (in seconds)
    config.timeout = 30

    # Optional: enable logging in development
    if Rails.env.development?
      config.logger = Rails.logger
      config.log_level = :debug
    end
  end
end

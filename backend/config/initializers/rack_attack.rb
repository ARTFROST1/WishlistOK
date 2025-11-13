# Rate limiting and abuse prevention with Rack::Attack
class Rack::Attack
  # Enable/disable based on environment
  Rack::Attack.enabled = Rails.env.production? || ENV['ENABLE_RACK_ATTACK'] == 'true'

  # Configuration
  Rack::Attack.cache.store = ActiveSupport::Cache::RedisCacheStore.new(
    url: ENV.fetch('REDIS_URL', 'redis://localhost:6379/0')
  )

  # Allow localhost in development
  safelist('allow-localhost-dev') do |req|
    Rails.env.development? && ['127.0.0.1', '::1', 'localhost'].include?(req.ip)
  end

  # Allow health check endpoints
  safelist('allow-health-check') do |req|
    req.path == '/up' || req.path == '/health'
  end

  # Throttle general requests by IP
  throttle('requests/ip', limit: 300, period: 5.minutes) do |req|
    req.ip unless req.path.start_with?('/assets')
  end

  # Throttle login attempts by IP
  throttle('auth/ip', limit: 10, period: 20.minutes) do |req|
    if req.path.match?(%r{^/api/v1/auth/(sign_in|sign_up)$}) && req.post?
      req.ip
    end
  end

  # Throttle login attempts by email
  throttle('auth/email', limit: 5, period: 20.minutes) do |req|
    if req.path.match?(%r{^/api/v1/auth/(sign_in|sign_up)$}) && req.post?
      email = req.params.dig('user', 'email') || req.params['email']
      email.to_s.downcase.gsub(/\s+/, '') if email.present?
    end
  end

  # Throttle API requests by authenticated user
  throttle('api/user', limit: 1000, period: 1.hour) do |req|
    if req.path.start_with?('/api/') && req.env['warden']&.user
      req.env['warden'].user.id
    end
  end

  # Throttle password reset requests
  throttle('password-reset/email', limit: 3, period: 1.hour) do |req|
    if req.path == '/api/v1/auth/password' && req.post?
      email = req.params.dig('user', 'email') || req.params['email']
      email.to_s.downcase.gsub(/\s+/, '') if email.present?
    end
  end

  # Block suspicious requests
  blocklist('block-bad-ua') do |req|
    req.user_agent.match?(/curl|wget|python-requests/i) && Rails.env.production?
  end

  # Custom response for throttled requests
  self.throttled_response = lambda do |env|
    match_data = env['rack.attack.match_data']
    now = match_data[:epoch_time]
    
    headers = {
      'Content-Type' => 'application/json',
      'Retry-After' => (match_data[:period] - (now % match_data[:period])).to_s
    }

    body = {
      error: 'Rate limit exceeded',
      message: 'Too many requests. Please try again later.',
      retry_after: match_data[:period] - (now % match_data[:period])
    }.to_json

    [429, headers, [body]]
  end

  # Custom response for blocked requests
  self.blocklisted_response = lambda do |env|
    [403, {'Content-Type' => 'application/json'}, [{
      error: 'Forbidden',
      message: 'Your request has been blocked.'
    }.to_json]]
  end
end

# ActiveSupport notification logging
ActiveSupport::Notifications.subscribe('rack.attack') do |name, start, finish, request_id, payload|
  req = payload[:request]
  Rails.logger.warn "[Rack::Attack] #{req.env['rack.attack.match_type']} #{req.ip} #{req.request_method} #{req.fullpath}"
end

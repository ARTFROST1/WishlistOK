# JWT configuration for Devise
Devise.setup do |config|
  config.jwt do |jwt|
    # Secret key for JWT signing
    jwt.secret = Rails.application.credentials.jwt_secret_key ||
                 ENV['JWT_SECRET_KEY'] ||
                 Rails.application.secret_key_base

    # Dispatch JWT for all requests except sign out
    jwt.dispatch_requests = [
      ['POST', %r{^/api/v1/auth/sign_in$}],
      ['POST', %r{^/api/v1/auth/sign_up$}]
    ]
    
    # Revocation requests (logout)
    jwt.revocation_requests = [
      ['DELETE', %r{^/api/v1/auth/sign_out$}]
    ]
    
    # Expiration time for JWT tokens
    jwt.expiration_time = 1.day.to_i
    
    # JWT algorithm
    jwt.algorithm = 'HS256'
  end
end

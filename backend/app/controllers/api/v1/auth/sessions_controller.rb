class Api::V1::Auth::SessionsController < Devise::SessionsController
  include RackSessionsFix
  respond_to :json

  private

  def respond_with(current_user, _opts = {})
    if current_user
      render_success(
        {
          user: UserSerializer.new(current_user).serializable_hash[:data][:attributes],
          token: request.env['warden-jwt_auth.token']
        },
        message: 'Signed in successfully'
      )
    else
      render_error('Invalid email or password', status: :unauthorized)
    end
  end

  def respond_to_on_destroy
    if request.headers['Authorization'].present?
      jwt_payload = JWT.decode(
        request.headers['Authorization'].split(' ').last,
        Rails.application.credentials.jwt_secret_key || ENV['JWT_SECRET_KEY']
      ).first
      
      current_user = User.find(jwt_payload['sub'])
      
      if current_user
        render_success(message: 'Signed out successfully')
      else
        render_error('User not found', status: :unauthorized)
      end
    else
      render_error('Missing authorization token', status: :unauthorized)
    end
  rescue JWT::DecodeError
    render_error('Invalid token', status: :unauthorized)
  end

  protected

  def render_success(data = nil, message: nil, status: :ok)
    response = { 
      success: true,
      timestamp: Time.current.iso8601
    }
    response[:message] = message if message
    response[:data] = data if data
    
    render json: response, status: status
  end

  def render_error(message, details: nil, status: :bad_request)
    response = {
      success: false,
      error: {
        message: message,
        timestamp: Time.current.iso8601
      }
    }
    response[:error][:details] = details if details
    
    render json: response, status: status
  end
end

class Api::V1::Auth::RegistrationsController < Devise::RegistrationsController
  include RackSessionsFix
  respond_to :json

  private

  def respond_with(current_user, _opts = {})
    if current_user.persisted?
      render_success(
        {
          user: UserSerializer.new(current_user).serializable_hash[:data][:attributes],
          token: request.env['warden-jwt_auth.token']
        },
        message: 'Account created successfully'
      )
    else
      render_error(
        'Registration failed',
        details: current_user.errors.full_messages,
        status: :unprocessable_entity
      )
    end
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

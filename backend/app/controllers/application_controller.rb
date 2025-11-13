class ApplicationController < ActionController::API
  include ActionController::MimeResponds
  
  # Handle authentication with Devise + JWT
  before_action :authenticate_user!, except: [:health_check]
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Exception handling
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  rescue_from ActionController::ParameterMissing, with: :parameter_missing
  rescue_from JWT::DecodeError, with: :jwt_decode_error

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end

  # Current user helper for API controllers
  def current_user_id
    current_user&.id
  end

  # Check if current user is guest
  def guest_user?
    current_user&.guest?
  end

  # Pagination helpers
  def page_params
    params.permit(:page, :per_page)
  end

  def paginate(collection, per_page: 20)
    page = [params[:page].to_i, 1].max
    per_page = [[params[:per_page].to_i, per_page].max, 100].min
    
    collection.page(page).per(per_page)
  end

  private

  def record_not_found(exception)
    render json: {
      error: 'Record not found',
      message: exception.message
    }, status: :not_found
  end

  def record_invalid(exception)
    render json: {
      error: 'Validation failed',
      message: exception.message,
      details: exception.record.errors.full_messages
    }, status: :unprocessable_entity
  end

  def parameter_missing(exception)
    render json: {
      error: 'Missing parameter',
      message: exception.message
    }, status: :bad_request
  end

  def jwt_decode_error(exception)
    render json: {
      error: 'Invalid token',
      message: 'Authentication token is invalid or expired'
    }, status: :unauthorized
  end

  # Helper method to render success responses
  def render_success(data = nil, message: nil, status: :ok)
    response = { success: true }
    response[:message] = message if message
    response[:data] = data if data
    
    render json: response, status: status
  end

  # Helper method to render error responses
  def render_error(message, details: nil, status: :bad_request)
    response = {
      success: false,
      error: message
    }
    response[:details] = details if details
    
    render json: response, status: status
  end
end

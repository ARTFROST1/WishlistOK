class Api::V1::BaseController < ApplicationController
  # API-specific configurations
  before_action :ensure_json_request
  before_action :set_default_response_format

  protected

  # Ensure all API requests are JSON
  def ensure_json_request
    unless request.content_type == 'application/json' || params[:format] == 'json'
      render json: { 
        error: 'Content type must be application/json' 
      }, status: :bad_request
    end
  end

  # Set default response format to JSON
  def set_default_response_format
    request.format = :json
  end

  # Override pagination for API
  def paginate(collection, per_page: 20)
    page = [params[:page].to_i, 1].max
    per_page = [[params[:per_page].to_i, per_page].max, 100].min
    
    paginated = collection.page(page).per(per_page)
    
    {
      data: paginated.map { |item| yield(item) if block_given? || item },
      pagination: {
        current_page: paginated.current_page,
        per_page: paginated.limit_value,
        total_pages: paginated.total_pages,
        total_count: paginated.total_count,
        next_page: paginated.next_page,
        prev_page: paginated.prev_page
      }
    }
  end

  # API-specific success response format
  def render_success(data = nil, message: nil, status: :ok, meta: {})
    response = { 
      success: true,
      timestamp: Time.current.iso8601
    }
    response[:message] = message if message
    response[:data] = data if data
    response[:meta] = meta if meta.any?
    
    render json: response, status: status
  end

  # API-specific error response format
  def render_error(message, details: nil, status: :bad_request, code: nil)
    response = {
      success: false,
      error: {
        message: message,
        timestamp: Time.current.iso8601
      }
    }
    response[:error][:code] = code if code
    response[:error][:details] = details if details
    
    render json: response, status: status
  end
end

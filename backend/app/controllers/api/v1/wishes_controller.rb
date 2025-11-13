class Api::V1::WishesController < Api::V1::BaseController
  before_action :set_wishlist, except: [:parse]
  before_action :set_wish, only: [:show, :update, :destroy]
  before_action :authorize_wishlist_access, except: [:parse, :show]
  before_action :authorize_wish_access, only: [:show]

  # GET /api/v1/wishlists/:wishlist_id/wishes
  def index
    @wishes = @wishlist.wishes.active.includes(:claims, :active_claim)
                      .order(created_at: :desc)
    
    render_success({
      wishes: serialize_wishes(@wishes)
    })
  end

  # GET /api/v1/wishlists/:wishlist_id/wishes/:id
  def show
    render_success({
      wish: serialize_wishes([@wish]).first
    })
  end

  # POST /api/v1/wishlists/:wishlist_id/wishes
  def create
    @wish = @wishlist.wishes.build(wish_params)

    if @wish.save
      render_success(
        {
          wish: serialize_wishes([@wish]).first
        },
        message: 'Wish created successfully',
        status: :created
      )
    else
      render_error(
        'Failed to create wish',
        details: @wish.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  end

  # PUT/PATCH /api/v1/wishlists/:wishlist_id/wishes/:id
  def update
    if @wish.update(wish_params)
      render_success(
        {
          wish: serialize_wishes([@wish]).first
        },
        message: 'Wish updated successfully'
      )
    else
      render_error(
        'Failed to update wish',
        details: @wish.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  end

  # DELETE /api/v1/wishlists/:wishlist_id/wishes/:id
  def destroy
    if @wish.destroy
      render_success(message: 'Wish deleted successfully')
    else
      render_error('Failed to delete wish', status: :unprocessable_entity)
    end
  end

  # POST /api/v1/wishes/parse
  # Parse URL and return preview data (used by extension and app)
  def parse
    url = params[:url]
    
    unless url.present?
      render_error('URL is required', status: :bad_request)
      return
    end

    unless valid_url?(url)
      render_error('Invalid URL format', status: :bad_request)
      return
    end

    # Enqueue parsing job and return job ID for tracking
    job = ParseWishJob.perform_later(url, current_user&.id)
    
    # For MVP, we'll do synchronous parsing for simplicity
    # In production, this should be async with WebSocket updates
    begin
      parsed_data = WishParserService.new(url).call
      
      if parsed_data[:success]
        render_success(
          {
            preview: {
              title: parsed_data[:title],
              description: parsed_data[:description],
              image_url: parsed_data[:image_url],
              price: parsed_data[:price],
              currency: parsed_data[:currency],
              brand: parsed_data[:brand],
              category: parsed_data[:category],
              url: url,
              images: parsed_data[:images] || []
            },
            job_id: job.job_id
          },
          message: 'URL parsed successfully'
        )
      else
        render_error(
          'Failed to parse URL',
          details: [parsed_data[:error] || 'Unknown parsing error'],
          status: :unprocessable_entity
        )
      end
    rescue => e
      render_error(
        'Parsing service unavailable',
        details: [e.message],
        status: :service_unavailable
      )
    end
  end

  private

  def set_wishlist
    if params[:wishlist_id]
      @wishlist = current_user.wishlists.find(params[:wishlist_id])
    end
  rescue ActiveRecord::RecordNotFound
    render_error('Wishlist not found', status: :not_found)
  end

  def set_wish
    @wish = @wishlist.wishes.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_error('Wish not found', status: :not_found)
  end

  def authorize_wishlist_access
    return if @wishlist&.user == current_user
    
    render_error('Access denied', status: :forbidden)
  end

  def authorize_wish_access
    # Allow access if:
    # 1. User owns the wishlist
    # 2. Wishlist is public or link_only (for viewing)
    return if @wishlist.user == current_user
    return if @wishlist.public?
    return if @wishlist.link_only? && params[:token] == @wishlist.share_token
    
    render_error('Access denied', status: :forbidden)
  end

  def serialize_wishes(wishes)
    WishSerializer.new(
      wishes,
      { params: { current_user: current_user } }
    ).serializable_hash[:data].map { |w| w[:attributes] }
  end

  def wish_params
    params.require(:wish).permit(
      :title, :description, :url, :image_url, :price, :currency, :note,
      :priority, :brand, :category, images: []
    )
  end

  def valid_url?(url)
    uri = URI.parse(url)
    uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)
  rescue URI::InvalidURIError
    false
  end
end

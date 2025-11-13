class Api::V1::WishlistsController < Api::V1::BaseController
  before_action :set_wishlist, only: [:show, :update, :destroy, :share_link]
  before_action :authorize_wishlist_access, only: [:show, :update, :destroy]

  # GET /api/v1/wishlists
  def index
    @wishlists = current_user.wishlists.active.includes(:wishes)
                            .order(created_at: :desc)
    
    render_success({
      wishlists: WishlistSerializer.new(@wishlists).serializable_hash[:data].map { |w| w[:attributes] }
    })
  end

  # GET /api/v1/wishlists/:id
  def show
    render_success({
      wishlist: WishlistSerializer.new(@wishlist, { include: [:wishes] }).serializable_hash[:data][:attributes]
    })
  end

  # POST /api/v1/wishlists
  def create
    @wishlist = current_user.wishlists.build(wishlist_params)

    if @wishlist.save
      render_success(
        {
          wishlist: WishlistSerializer.new(@wishlist).serializable_hash[:data][:attributes]
        },
        message: 'Wishlist created successfully',
        status: :created
      )
    else
      render_error(
        'Failed to create wishlist',
        details: @wishlist.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  end

  # PUT/PATCH /api/v1/wishlists/:id
  def update
    if @wishlist.update(wishlist_params)
      render_success(
        {
          wishlist: WishlistSerializer.new(@wishlist).serializable_hash[:data][:attributes]
        },
        message: 'Wishlist updated successfully'
      )
    else
      render_error(
        'Failed to update wishlist',
        details: @wishlist.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  end

  # DELETE /api/v1/wishlists/:id
  def destroy
    if @wishlist.destroy
      render_success(message: 'Wishlist deleted successfully')
    else
      render_error('Failed to delete wishlist', status: :unprocessable_entity)
    end
  end

  # GET /api/v1/wishlists/:id/share_link
  def share_link
    unless @wishlist.visibility.in?(['public', 'link_only'])
      render_error('Private wishlists cannot be shared', status: :forbidden)
      return
    end

    share_url = @wishlist.share_url
    if share_url
      render_success({
        share_url: "#{request.base_url}#{share_url}",
        visibility: @wishlist.visibility,
        expires_at: nil # Links don't expire in MVP
      })
    else
      render_error('Unable to generate share link', status: :unprocessable_entity)
    end
  end

  # GET /api/v1/wishlists/by_slug/:slug
  def by_slug
    @wishlist = Wishlist.find_by!(slug: params[:slug])
    
    # Check visibility permissions
    unless can_view_wishlist?(@wishlist)
      render_error('Wishlist not found or not accessible', status: :not_found)
      return
    end

    render_success({
      wishlist: WishlistSerializer.new(@wishlist, { include: [:wishes] }).serializable_hash[:data][:attributes]
    })
  rescue ActiveRecord::RecordNotFound
    render_error('Wishlist not found', status: :not_found)
  end

  # GET /api/v1/wishlists/shared/:id?token=:token
  def shared
    @wishlist = Wishlist.find(params[:id])
    
    # Verify share token for link-only wishlists
    if @wishlist.link_only? && params[:token] != @wishlist.share_token
      render_error('Invalid share token', status: :forbidden)
      return
    end

    unless can_view_wishlist?(@wishlist)
      render_error('Wishlist not found or not accessible', status: :not_found)
      return
    end

    render_success({
      wishlist: WishlistSerializer.new(@wishlist, { include: [:wishes] }).serializable_hash[:data][:attributes]
    })
  rescue ActiveRecord::RecordNotFound
    render_error('Wishlist not found', status: :not_found)
  end

  private

  def set_wishlist
    @wishlist = current_user.wishlists.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_error('Wishlist not found', status: :not_found)
  end

  def authorize_wishlist_access
    return if @wishlist&.user == current_user
    
    render_error('Access denied', status: :forbidden)
  end

  def can_view_wishlist?(wishlist)
    return true if wishlist.public?
    return true if wishlist.user == current_user
    return true if wishlist.link_only? && params[:token] == wishlist.share_token
    false
  end

  def wishlist_params
    params.require(:wishlist).permit(
      :title, :description, :event_date, :visibility, :theme_color
    )
  end
end

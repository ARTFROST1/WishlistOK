class Public::WishlistsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_wishlist
  before_action :check_visibility

  # GET /p/:slug
  def show
    @wishes = @wishlist.wishes.active.includes(:claims, :active_claim)
                      .order(priority: :desc, created_at: :desc)
    
    # Separate available and claimed wishes for display using database queries
    @available_wishes = @wishes.where(status: :available)
    @claimed_wishes = @wishes.where(status: [:claimed, :purchased])

    # SEO and social meta data
    @page_title = "#{@wishlist.title} - WishApp"
    @page_description = @wishlist.description.presence || "Check out #{@wishlist.title} wishlist on WishApp"
    @page_image = @wishes.first&.primary_image
    @canonical_url = request.original_url

    # Set up breadcrumbs
    @breadcrumbs = [
      { name: 'WishApp', url: root_url },
      { name: @wishlist.title, url: nil }
    ]

    respond_to do |format|
      format.html # render show.html.erb
      format.json { 
        render json: {
          wishlist: WishlistSerializer.new(@wishlist, { include: [:wishes] }).serializable_hash[:data][:attributes]
        }
      }
    end
  end

  private

  def set_wishlist
    @wishlist = Wishlist.find_by!(slug: params[:slug])
  rescue ActiveRecord::RecordNotFound
    render file: 'public/404.html', status: :not_found
  end

  def check_visibility
    # Only public wishlists are accessible via /p/:slug
    unless @wishlist&.public?
      render file: 'public/404.html', status: :not_found
    end
  end
end

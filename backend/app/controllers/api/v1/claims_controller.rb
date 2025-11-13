class Api::V1::ClaimsController < Api::V1::BaseController
  before_action :set_wish
  before_action :set_claim, only: [:show, :update, :destroy, :mark_purchased]
  before_action :authorize_claim_access, only: [:show, :update, :destroy, :mark_purchased]
  skip_before_action :authenticate_user!, only: [:create]

  # GET /api/v1/wishes/:wish_id/claims
  def index
    # Only wishlist owner can see all claims (respecting surprise mode)
    unless @wish.wishlist.user == current_user
      render_error('Access denied', status: :forbidden)
      return
    end

    @claims = @wish.claims.includes(:user)
    
    # Filter based on surprise mode for owner visibility
    visible_claims = @claims.select do |claim|
      !claim.is_surprise || claim.status == 'purchased'
    end

    render_success({
      claims: serialize_claims(visible_claims)
    })
  end

  # GET /api/v1/wishes/:wish_id/claims/:id
  def show
    render_success({
      claim: serialize_claims([@claim]).first
    })
  end

  # POST /api/v1/wishes/:wish_id/claims
  def create
    # Handle guest user creation for Lite Mode
    if current_user.nil?
      guest = Guest.find_or_create_for_claim(
        ip_address: request.remote_ip,
        user_agent: request.user_agent
      )
      @current_user = guest.user
    else
      @current_user = current_user
    end

    # Check if wish can be claimed
    unless @wish.can_be_claimed_by?(@current_user)
      render_error('This wish cannot be claimed', status: :unprocessable_entity)
      return
    end

    @claim = @wish.claims.build(claim_params.merge(user: @current_user))
    
    if @claim.save
      # Update guest activity if applicable
      if @current_user.guest? && @current_user.guest
        @current_user.guest.update_activity!(
          ip_address: request.remote_ip,
          user_agent: request.user_agent
        )
      end

      response_data = {
        claim: serialize_claims([@claim]).first
      }

      # Include auth token for new guest users
      if @current_user != current_user
        # Sign in the guest user to generate token
        sign_in @current_user
        token = request.env['warden-jwt_auth.token']
        response_data[:auth] = {
          user: UserSerializer.new(@current_user).serializable_hash[:data][:attributes],
          token: token
        }
      end

      render_success(
        response_data,
        message: 'Wish claimed successfully',
        status: :created
      )
    else
      render_error(
        'Failed to claim wish',
        details: @claim.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  end

  # PUT/PATCH /api/v1/wishes/:wish_id/claims/:id
  def update
    if @claim.update(claim_update_params)
      render_success(
        {
          claim: serialize_claims([@claim]).first
        },
        message: 'Claim updated successfully'
      )
    else
      render_error(
        'Failed to update claim',
        details: @claim.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  end

  # DELETE /api/v1/wishes/:wish_id/claims/:id (unclaim)
  def destroy
    if @claim.destroy
      render_success(message: 'Wish unclaimed successfully')
    else
      render_error('Failed to unclaim wish', status: :unprocessable_entity)
    end
  end

  # POST /api/v1/wishes/:wish_id/claims/:id/mark_purchased
  def mark_purchased
    unless @claim.can_mark_purchased?
      render_error('Cannot mark as purchased', status: :unprocessable_entity)
      return
    end

    if @claim.mark_as_purchased!
      render_success(
        {
          claim: serialize_claims([@claim]).first
        },
        message: 'Marked as purchased successfully'
      )
    else
      render_error(
        'Failed to mark as purchased',
        details: @claim.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  end

  # GET /api/v1/users/:user_id/claims (user's claims)
  def user_claims
    target_user = current_user # For now, users can only see their own claims
    
    @claims = target_user.claims.includes(:wish, wish: :wishlist)
                         .order(created_at: :desc)

    render_success({
      claims: serialize_claims(@claims, include_wish: true)
    })
  end

  private

  def set_wish
    @wish = Wish.find(params[:wish_id])
    
    # Check if user can access this wish
    wishlist = @wish.wishlist
    return if wishlist.public?
    return if current_user && wishlist.user == current_user
    return if wishlist.link_only? && params[:token] == wishlist.share_token
    
    render_error('Wish not found', status: :not_found)
  rescue ActiveRecord::RecordNotFound
    render_error('Wish not found', status: :not_found)
  end

  def set_claim
    @claim = @wish.claims.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render_error('Claim not found', status: :not_found)
  end

  def authorize_claim_access
    # User can access claim if:
    # 1. They are the claimer
    # 2. They own the wishlist (and it's not a surprise, or it's purchased)
    # 3. They are admin (future feature)
    
    return if @claim.user == current_user
    return if @wish.wishlist.user == current_user
    
    render_error('Access denied', status: :forbidden)
  end

  def serialize_claims(claims, include_wish: false)
    ClaimSerializer.new(
      claims,
      { 
        params: { 
          current_user: current_user || @current_user,
          include_wish: include_wish
        }
      }
    ).serializable_hash[:data].map { |c| c[:attributes] }
  end

  def claim_params
    params.require(:claim).permit(:note, :contribution_amount, :currency, :is_surprise)
  end

  def claim_update_params
    params.require(:claim).permit(:note, :contribution_amount, :is_surprise)
  end
end

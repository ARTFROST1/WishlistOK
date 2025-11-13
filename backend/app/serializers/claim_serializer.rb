class ClaimSerializer
  include JSONAPI::Serializer
  
  attributes :id, :status, :note, :contribution_amount, :currency, :purchased_at, 
             :is_surprise, :created_at, :updated_at
  
  # Computed attributes
  attribute :formatted_contribution do |claim|
    claim.formatted_contribution
  end
  
  attribute :can_mark_purchased do |claim|
    claim.can_mark_purchased?
  end
  
  attribute :is_owner_visible do |claim|
    claim.is_owner_visible?
  end

  # Claimer information (conditional based on privacy)
  attribute :claimer do |claim, params|
    current_user = params&.dig(:current_user)
    
    # Show claimer info if:
    # 1. Current user is the claimer
    # 2. Current user owns the wishlist and claim is not a surprise
    # 3. Claim is purchased (surprises are revealed when purchased)
    
    show_claimer = false
    show_claimer = true if current_user == claim.user
    show_claimer = true if current_user == claim.wish.wishlist.user && (!claim.is_surprise || claim.purchased?)
    
    if show_claimer
      {
        id: claim.user.id,
        display_name: claim.user.display_name,
        is_guest: claim.user.guest?
      }
    else
      {
        display_name: claim.is_surprise ? 'Someone' : claim.user.display_name,
        is_anonymous: claim.is_surprise
      }
    end
  end

  # Wish information (when included)
  attribute :wish, if: Proc.new { |record, params|
    params && params[:include_wish]
  } do |claim|
    wish = claim.wish
    {
      id: wish.id,
      title: wish.title,
      image_url: wish.primary_image,
      price: wish.formatted_price,
      status: wish.status,
      wishlist: {
        id: wish.wishlist.id,
        title: wish.wishlist.title,
        slug: wish.wishlist.slug,
        owner: {
          id: wish.wishlist.user.id,
          display_name: wish.wishlist.user.display_name
        }
      }
    }
  end

  # User permissions
  attribute :can_edit do |claim, params|
    current_user = params&.dig(:current_user)
    return false unless current_user
    claim.user == current_user
  end
  
  attribute :can_cancel do |claim, params|
    current_user = params&.dig(:current_user)
    return false unless current_user
    claim.user == current_user && claim.claimed?
  end
end

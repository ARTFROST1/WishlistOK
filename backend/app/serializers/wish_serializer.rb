class WishSerializer
  include JSONAPI::Serializer
  
  attributes :id, :title, :description, :url, :image_url, :price, :currency, :note, 
             :status, :priority, :active, :brand, :category, :images, :created_at, :updated_at
  
  # Computed attributes
  attribute :formatted_price do |wish|
    wish.formatted_price
  end
  
  attribute :primary_image do |wish|
    wish.primary_image
  end
  
  attribute :all_images do |wish|
    wish.all_images
  end
  
  attribute :claimed do |wish|
    wish.claimed?
  end
  
  attribute :purchased do |wish|
    wish.purchased?
  end
  
  attribute :total_contributions do |wish|
    wish.total_contributions
  end
  
  attribute :contribution_progress do |wish|
    wish.contribution_progress
  end
  
  attribute :fully_funded do |wish|
    wish.fully_funded?
  end

  # Conditional attributes based on user permissions
  attribute :claimer, if: Proc.new { |wish, params|
    # Only show claimer info if:
    # 1. Current user is the wishlist owner AND the claim is not a surprise
    # 2. OR current user is the claimer themselves
    current_user = params&.dig(:current_user)
    active_claim = wish.active_claim
    
    return nil unless active_claim
    
    if current_user == wish.wishlist.user && !active_claim.is_surprise
      {
        id: active_claim.user.id,
        display_name: active_claim.user.display_name,
        claimed_at: active_claim.created_at
      }
    elsif current_user == active_claim.user
      {
        id: active_claim.user.id,
        display_name: active_claim.user.display_name,
        claimed_at: active_claim.created_at
      }
    else
      nil
    end
  end do |wish, params|
    current_user = params&.dig(:current_user)
    active_claim = wish.active_claim
    
    next nil unless active_claim
    
    if current_user == wish.wishlist.user && !active_claim.is_surprise
      {
        id: active_claim.user.id,
        display_name: active_claim.user.display_name,
        claimed_at: active_claim.created_at
      }
    elsif current_user == active_claim.user
      {
        id: active_claim.user.id,
        display_name: active_claim.user.display_name,
        claimed_at: active_claim.created_at
      }
    else
      nil
    end
  end

  # User permissions
  attribute :can_claim do |wish, params|
    current_user = params&.dig(:current_user)
    return false unless current_user
    wish.can_be_claimed_by?(current_user)
  end
  
  attribute :can_edit do |wish, params|
    current_user = params&.dig(:current_user)
    return false unless current_user
    wish.wishlist.user == current_user
  end

  # Wishlist info (basic)
  attribute :wishlist do |wish|
    {
      id: wish.wishlist.id,
      title: wish.wishlist.title,
      slug: wish.wishlist.slug
    }
  end
end

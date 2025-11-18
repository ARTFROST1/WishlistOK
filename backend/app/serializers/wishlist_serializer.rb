class WishlistSerializer
  include JSONAPI::Serializer
  
  attributes :id, :title, :description, :event_date, :slug, :visibility, :theme_color, 
             :active, :wishes_count, :claimed_wishes_count, :created_at, :updated_at
  
  # Computed attributes
  attribute :days_until_event do |wishlist|
    wishlist.days_until_event
  end
  
  attribute :event_status do |wishlist|
    wishlist.event_status
  end
  
  attribute :share_url do |wishlist|
    wishlist.share_url
  end
  
  attribute :progress_percentage do |wishlist|
    wishlist.progress_percentage
  end
  
  attribute :can_be_shared do |wishlist|
    wishlist.visibility&.to_sym&.in?([:public, :link_only])
  end

  # Associations
  has_many :wishes, serializer: WishSerializer, if: Proc.new { |record, params|
    params && params[:include] && params[:include].include?(:wishes)
  }

  # Owner information
  attribute :owner do |wishlist|
    {
      id: wishlist.user.id,
      display_name: wishlist.user.display_name,
      is_guest: wishlist.user.guest?
    }
  end
end

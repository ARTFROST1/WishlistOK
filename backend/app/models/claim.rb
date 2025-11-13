class Claim < ApplicationRecord
  belongs_to :wish
  belongs_to :user

  # Enums
  enum :status, { claimed: 0, purchased: 1, cancelled: 2 }

  # Validations
  validates :user_id, uniqueness: { scope: :wish_id, message: "has already claimed this wish" }
  validates :contribution_amount, numericality: { greater_than: 0 }, allow_blank: true
  validates :currency, inclusion: { in: %w[USD EUR RUB GBP] }, allow_blank: true
  validate :cannot_claim_own_wish
  validate :wish_must_be_available, on: :create

  # Callbacks
  after_create :update_wish_status
  after_update :update_wish_status_on_status_change, if: :saved_change_to_status?
  after_destroy :update_wish_status

  # Scopes
  scope :active, -> { where(status: [:claimed, :purchased]) }
  scope :by_user, ->(user) { where(user: user) }
  scope :surprises, -> { where(is_surprise: true) }
  scope :visible_to_owner, -> { where(is_surprise: false) }

  # Instance methods
  def can_mark_purchased?
    claimed? && user.present?
  end

  def mark_as_purchased!
    update!(
      status: :purchased,
      purchased_at: Time.current
    )
  end

  def cancel!
    update!(status: :cancelled)
  end

  def formatted_contribution
    return nil unless contribution_amount && currency
    
    case currency
    when 'USD'
      "$#{contribution_amount}"
    when 'EUR'
      "€#{contribution_amount}"
    when 'RUB'
      "₽#{contribution_amount}"
    when 'GBP'
      "£#{contribution_amount}"
    else
      "#{contribution_amount} #{currency}"
    end
  end

  def is_owner_visible?
    !is_surprise
  end

  def claimer_name
    user.display_name
  end

  private

  def cannot_claim_own_wish
    return unless wish && user
    
    if wish.wishlist.user_id == user.id
      errors.add(:user, "cannot claim their own wishes")
    end
  end

  def wish_must_be_available
    return unless wish
    
    unless wish.available?
      errors.add(:wish, "is not available for claiming")
    end
  end

  def update_wish_status
    return unless wish

    active_claims_count = wish.claims.active.count
    
    if active_claims_count > 0
      # Check if fully funded for group gifts
      if wish.price && wish.total_contributions >= wish.price
        wish.update_column(:status, 'purchased')
      else
        wish.update_column(:status, 'claimed')
      end
    else
      wish.update_column(:status, 'available')
    end
  end

  def update_wish_status_on_status_change
    update_wish_status
  end
end

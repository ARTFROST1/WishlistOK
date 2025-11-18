class Wish < ApplicationRecord
  belongs_to :wishlist, counter_cache: true
  has_many :claims, dependent: :destroy
  has_one :active_claim, -> { where(status: [:claimed, :purchased]) }, class_name: 'Claim'

  # Enums
  enum :status, { available: 0, claimed: 1, purchased: 2 }
  enum :priority, { low: 0, medium: 1, high: 2 }

  # Validations
  validates :title, presence: true, length: { maximum: 255 }
  validates :url, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) }, allow_blank: true
  validates :price, numericality: { greater_than: 0 }, allow_blank: true
  validates :currency, inclusion: { in: %w[USD EUR RUB GBP] }, allow_blank: true
  validates :image_url, format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]) }, allow_blank: true

  # Callbacks
  after_update :update_wishlist_counters, if: :saved_change_to_status?
  before_save :normalize_url

  # Scopes
  scope :active, -> { where(active: true) }
  scope :by_status, ->(status) { where(status: status) }
  scope :by_priority, ->(priority) { where(priority: priority) }
  scope :with_price, -> { where.not(price: nil) }
  scope :in_price_range, ->(min, max) { where(price: min..max) }
  scope :by_category, ->(category) { where(category: category) }

  # Instance methods
  def claimed_by?(user)
    claims.where(user: user, status: [:claimed, :purchased]).exists?
  end

  def can_be_claimed_by?(user)
    return false unless available?
    return false if wishlist.user == user # owner can't claim their own wishes
    return false if claimed_by?(user)
    true
  end

  def claimer
    active_claim&.user
  end

  def claimed?
    status&.to_sym&.in?([:claimed, :purchased])
  end

  def purchased?
    status&.to_sym == :purchased
  end

  def formatted_price
    return nil unless price && currency
    
    case currency
    when 'USD'
      "$#{price}"
    when 'EUR'
      "€#{price}"
    when 'RUB'
      "₽#{price}"
    when 'GBP'
      "£#{price}"
    else
      "#{price} #{currency}"
    end
  end

  def primary_image
    if images.is_a?(Array) && images.any?
      images.first
    else
      image_url
    end
  end

  def all_images
    result = []
    result << image_url if image_url.present?
    result += images if images.is_a?(Array)
    result.uniq.compact
  end

  # Calculate total contributions for group gifts
  def total_contributions
    claims.sum(:contribution_amount) || 0
  end

  def contribution_progress
    return 0 unless price&.positive?
    ((total_contributions / price) * 100).round(1)
  end

  def fully_funded?
    price && total_contributions >= price
  end

  private

  def update_wishlist_counters
    wishlist.update_columns(
      claimed_wishes_count: wishlist.wishes.where(status: [:claimed, :purchased]).count
    )
  end

  def normalize_url
    return unless url.present?
    
    # Add protocol if missing
    unless url.match(/\Ahttps?:\/\//)
      self.url = "https://#{url}"
    end
  end
end

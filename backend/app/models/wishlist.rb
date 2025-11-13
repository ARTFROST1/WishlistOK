class Wishlist < ApplicationRecord
  belongs_to :user
  has_many :wishes, dependent: :destroy
  has_many :claims, through: :wishes

  # Enums
  enum visibility: { private: 0, link_only: 1, public: 2 }

  # Validations
  validates :title, presence: true, length: { maximum: 255 }
  validates :slug, presence: true, uniqueness: true, format: { with: /\A[a-z0-9\-_]+\z/ }
  validates :visibility, presence: true
  validates :theme_color, format: { with: /\A#[0-9A-Fa-f]{6}\z/ }, allow_blank: true

  # Callbacks
  before_validation :generate_slug, if: -> { slug.blank? }
  before_save :sanitize_theme_color

  # Scopes
  scope :active, -> { where(active: true) }
  scope :by_visibility, ->(visibility) { where(visibility: visibility) }
  scope :upcoming_events, -> { where('event_date >= ?', Date.current) }
  scope :past_events, -> { where('event_date < ?', Date.current) }

  # Instance methods
  def days_until_event
    return nil unless event_date
    (event_date - Date.current).to_i
  end

  def event_status
    return 'no_date' unless event_date
    
    days = days_until_event
    if days < 0
      'past'
    elsif days == 0
      'today'
    elsif days <= 7
      'this_week'
    elsif days <= 30
      'this_month'
    else
      'future'
    end
  end

  def share_url
    case visibility.to_sym
    when :public
      "/p/#{slug}"
    when :link_only
      "/list/#{id}?token=#{share_token}"
    else
      nil # private lists can't be shared
    end
  end

  def available_wishes
    wishes.active.where(status: :available)
  end

  def claimed_wishes
    wishes.active.where(status: [:claimed, :purchased])
  end

  def progress_percentage
    return 0 if wishes_count.zero?
    ((claimed_wishes_count.to_f / wishes_count) * 100).round(1)
  end

  # Generate secure share token for link-only wishlists
  def share_token
    @share_token ||= generate_share_token
  end

  private

  def generate_slug
    base_slug = title.parameterize
    candidate_slug = base_slug
    counter = 1

    while Wishlist.exists?(slug: candidate_slug)
      candidate_slug = "#{base_slug}-#{counter}"
      counter += 1
    end

    self.slug = candidate_slug
  end

  def sanitize_theme_color
    return unless theme_color.present?
    self.theme_color = theme_color.upcase
  end

  def generate_share_token
    # Simple token based on wishlist ID and created_at for consistency
    Digest::SHA256.hexdigest("#{id}-#{created_at.to_i}-#{Rails.application.secret_key_base}")[0..12]
  end
end

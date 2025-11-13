class Guest < ApplicationRecord
  belongs_to :user

  # Validations
  validates :identifier, presence: true, uniqueness: true
  validates :user_id, uniqueness: true # one guest record per user

  # Callbacks
  before_validation :generate_identifier, if: -> { identifier.blank? }
  before_create :generate_session_token

  # Scopes
  scope :active, -> { where('last_activity_at > ?', 30.days.ago) }
  scope :unconverted, -> { where(converted_to_regular: false) }
  scope :converted, -> { where(converted_to_regular: true) }

  # Class methods
  def self.create_for_user(user, ip_address: nil, user_agent: nil)
    create!(
      user: user,
      ip_address: ip_address,
      user_agent: user_agent,
      last_activity_at: Time.current
    )
  end

  def self.find_or_create_for_claim(ip_address: nil, user_agent: nil)
    # Try to find existing guest by IP and user agent (simple approach)
    # In production, you might use more sophisticated session management
    
    guest_user = User.create_guest_user
    create_for_user(
      guest_user,
      ip_address: ip_address,
      user_agent: user_agent
    )
  end

  # Instance methods
  def active?
    last_activity_at && last_activity_at > 30.days.ago
  end

  def convert_to_regular_user!(email:, password:, password_confirmation:, first_name: nil, last_name: nil)
    return false if converted_to_regular?

    ActiveRecord::Base.transaction do
      user.upgrade_to_regular_user!(
        email,
        password,
        password_confirmation,
        first_name: first_name,
        last_name: last_name
      )
      
      update!(
        converted_to_regular: true,
        converted_at: Time.current
      )
    end
  end

  def update_activity!(ip_address: nil, user_agent: nil)
    update!(
      last_activity_at: Time.current,
      ip_address: ip_address || self.ip_address,
      user_agent: user_agent || self.user_agent
    )
  end

  def display_name
    "Guest #{identifier.split('_').last[0..7]}"
  end

  def short_identifier
    identifier.split('_').last[0..7]
  end

  private

  def generate_identifier
    loop do
      self.identifier = "guest_#{SecureRandom.uuid}"
      break unless Guest.exists?(identifier: identifier)
    end
  end

  def generate_session_token
    self.session_token = SecureRandom.hex(32)
  end
end

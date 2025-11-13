class JwtDenylist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Denylist

  self.table_name = 'jwt_denylist'

  # Cleanup old tokens periodically
  scope :expired, -> { where('exp < ?', Time.current.to_i) }

  def self.cleanup_expired_tokens
    expired.delete_all
  end
end

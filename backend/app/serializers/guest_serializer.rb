class GuestSerializer
  include JSONAPI::Serializer
  
  attributes :id, :identifier, :last_activity_at, :converted_to_regular, :converted_at, :created_at
  
  # Computed attributes
  attribute :display_name do |guest|
    guest.display_name
  end
  
  attribute :short_identifier do |guest|
    guest.short_identifier
  end
  
  attribute :is_active do |guest|
    guest.active?
  end

  # Exclude sensitive data
  # session_token, ip_address, user_agent are excluded for security
end

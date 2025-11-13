class UserSerializer
  include JSONAPI::Serializer
  
  attributes :id, :email, :user_type, :active, :created_at
  
  # Computed attributes
  attribute :full_name do |user|
    user.full_name
  end
  
  attribute :display_name do |user|
    user.display_name
  end
  
  attribute :is_guest do |user|
    user.guest?
  end
  
  attribute :is_admin do |user|
    user.admin?
  end

  # Conditional attributes
  attribute :first_name, if: Proc.new { |user| !user.guest? }
  attribute :last_name, if: Proc.new { |user| !user.guest? }
  
  # Exclude sensitive information
  # password_digest, reset_password_token, etc. are automatically excluded
end

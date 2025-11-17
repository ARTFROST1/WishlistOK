class PaymentSerializer
  include JSONAPI::Serializer

  attributes :id, :amount, :currency, :status, :provider, :payment_method, :description

  # Formatted amount with currency symbol
  attribute :formatted_amount do |payment|
    payment.formatted_amount
  end

  # Timestamps
  attribute :created_at do |payment|
    payment.created_at&.iso8601
  end

  attribute :confirmed_at do |payment|
    payment.confirmed_at&.iso8601
  end

  # Payment URLs
  attribute :confirmation_url, if: Proc.new { |payment|
    payment.confirmation_url.present?
  }

  attribute :receipt_url, if: Proc.new { |payment|
    payment.receipt_url.present?
  }

  # Contributor information (conditional based on surprise mode)
  attribute :contributor, if: Proc.new { |payment, params|
    !params&.dig(:hide_user)
  } do |payment|
    user = payment.user
    {
      id: user.id,
      name: "#{user.first_name} #{user.last_name}".strip,
      avatar_url: user.avatar_url,
      is_guest: user.user_type == 'guest'
    }
  end

  # Wish information
  attribute :wish do |payment|
    {
      id: payment.wish.id,
      title: payment.wish.title,
      image_url: payment.wish.primary_image
    }
  end

  # Payment status info
  attribute :can_be_refunded do |payment|
    payment.can_be_refunded?
  end

  attribute :is_successful do |payment|
    payment.success?
  end
end

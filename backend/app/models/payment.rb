class Payment < ApplicationRecord
  belongs_to :claim
  belongs_to :user
  belongs_to :wish

  # Enums
  enum :status, {
    pending: 0,
    processing: 1,
    succeeded: 2,
    failed: 3,
    cancelled: 4,
    refunded: 5
  }

  enum :provider, {
    yookassa: 0,
    cloudpayments: 1
  }, _prefix: true

  # Validations
  validates :provider_payment_id, presence: true, uniqueness: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :currency, presence: true, inclusion: { in: %w[RUB USD EUR] }
  validates :status, presence: true

  # Callbacks
  after_update :update_claim_on_success, if: :saved_change_to_status?

  # Scopes
  scope :successful, -> { where(status: :succeeded) }
  scope :pending_or_processing, -> { where(status: [:pending, :processing]) }
  scope :for_wish, ->(wish) { where(wish: wish) }
  scope :recent, -> { order(created_at: :desc) }

  # Instance methods
  def success?
    succeeded?
  end

  def can_be_refunded?
    succeeded? && refunded_at.nil? && created_at > 30.days.ago
  end

  def formatted_amount
    case currency
    when 'RUB'
      "₽#{amount}"
    when 'USD'
      "$#{amount}"
    when 'EUR'
      "€#{amount}"
    else
      "#{amount} #{currency}"
    end
  end

  def mark_as_succeeded!(provider_data = {})
    update!(
      status: :succeeded,
      confirmed_at: Time.current,
      provider_response: provider_response.merge(provider_data)
    )
  end

  def mark_as_failed!(error_message = nil)
    update!(
      status: :failed,
      failed_at: Time.current,
      metadata: metadata.merge(error: error_message)
    )
  end

  private

  def update_claim_on_success
    return unless succeeded? && saved_change_to_status_to_succeeded?

    # Update claim's contribution amount
    claim.update!(
      contribution_amount: (claim.contribution_amount || 0) + amount
    )

    # Check if wish is fully funded
    if wish.fully_funded? && wish.available?
      wish.update!(status: :claimed)
    end
  end
end

class PaymentService
  class PaymentError < StandardError; end

  def initialize(user:, wish:, amount:, currency: 'RUB')
    @user = user
    @wish = wish
    @amount = amount.to_f
    @currency = currency
    @provider = :yookassa # Default provider
  end

  # Create a payment
  def create_payment
    validate_payment!

    # Find or create claim
    claim = find_or_create_claim

    # Create payment record
    payment = Payment.create!(
      user: @user,
      wish: @wish,
      claim: claim,
      amount: @amount,
      currency: @currency,
      provider: @provider,
      provider_payment_id: SecureRandom.uuid, # Will be updated by provider
      status: :pending,
      description: "Contribution for #{@wish.title}"
    )

    # Create payment with provider
    provider_response = create_provider_payment(payment)

    # Update payment with provider data
    payment.update!(
      provider_payment_id: provider_response[:id],
      confirmation_url: provider_response[:confirmation_url],
      provider_response: provider_response
    )

    payment
  rescue StandardError => e
    Rails.logger.error("Payment creation failed: #{e.message}")
    raise PaymentError, e.message
  end

  # Process webhook from payment provider
  def self.process_webhook(provider, payload)
    case provider.to_sym
    when :yookassa
      process_yookassa_webhook(payload)
    when :cloudpayments
      process_cloudpayments_webhook(payload)
    else
      raise PaymentError, "Unknown provider: #{provider}"
    end
  end

  # Refund a payment
  def self.refund_payment(payment, amount: nil)
    raise PaymentError, "Payment cannot be refunded" unless payment.can_be_refunded?

    refund_amount = amount || payment.amount

    case payment.provider.to_sym
    when :yookassa
      refund_yookassa_payment(payment, refund_amount)
    when :cloudpayments
      refund_cloudpayments_payment(payment, refund_amount)
    end

    payment.update!(
      status: :refunded,
      refunded_at: Time.current
    )

    # Update claim contribution amount
    payment.claim.update!(
      contribution_amount: [payment.claim.contribution_amount - refund_amount, 0].max
    )

    payment
  end

  private

  def validate_payment!
    raise PaymentError, "Amount must be positive" unless @amount.positive?
    raise PaymentError, "Wish not found" unless @wish
    raise PaymentError, "User not found" unless @user
    raise PaymentError, "Cannot contribute to your own wish" if @wish.wishlist.user == @user
    raise PaymentError, "Wish is not available" unless @wish.available? || @wish.claimed?
  end

  def find_or_create_claim
    claim = Claim.find_or_initialize_by(
      user: @user,
      wish: @wish
    )

    if claim.new_record?
      claim.assign_attributes(
        status: :claimed,
        contribution_amount: 0,
        currency: @currency,
        is_surprise: true
      )
      claim.save!
    end

    claim
  end

  def create_provider_payment(payment)
    case @provider
    when :yookassa
      create_yookassa_payment(payment)
    when :cloudpayments
      create_cloudpayments_payment(payment)
    else
      raise PaymentError, "Unsupported provider: #{@provider}"
    end
  end

  # YooKassa integration
  def create_yookassa_payment(payment)
    client = yookassa_client

    response = client.create_payment(
      {
        amount: {
          value: format("%.2f", @amount),
          currency: @currency
        },
        confirmation: {
          type: 'redirect',
          return_url: "#{ENV['FRONTEND_URL']}/payments/success"
        },
        capture: true,
        description: payment.description,
        metadata: {
          payment_id: payment.id,
          wish_id: @wish.id,
          user_id: @user.id
        }
      },
      SecureRandom.uuid # idempotency key
    )

    {
      id: response['id'],
      status: response['status'],
      confirmation_url: response['confirmation']['confirmation_url'],
      raw: response
    }
  rescue StandardError => e
    Rails.logger.error("YooKassa payment creation failed: #{e.message}")
    raise PaymentError, "Payment provider error: #{e.message}"
  end

  def self.process_yookassa_webhook(payload)
    event_type = payload['event']
    payment_data = payload['object']

    return unless event_type == 'payment.succeeded'

    payment = Payment.find_by(provider_payment_id: payment_data['id'])
    return unless payment

    payment.mark_as_succeeded!(payment_data)
  end

  def self.refund_yookassa_payment(payment, amount)
    client = yookassa_client

    client.create_refund(
      {
        payment_id: payment.provider_payment_id,
        amount: {
          value: format("%.2f", amount),
          currency: payment.currency
        }
      },
      SecureRandom.uuid
    )
  end

  # CloudPayments integration (placeholder)
  def create_cloudpayments_payment(payment)
    # TODO: Implement CloudPayments integration
    raise PaymentError, "CloudPayments not yet implemented"
  end

  def self.process_cloudpayments_webhook(payload)
    # TODO: Implement CloudPayments webhook processing
    raise PaymentError, "CloudPayments not yet implemented"
  end

  def self.refund_cloudpayments_payment(payment, amount)
    # TODO: Implement CloudPayments refund
    raise PaymentError, "CloudPayments not yet implemented"
  end

  # Helper methods
  def yookassa_client
    self.class.yookassa_client
  end

  def self.yookassa_client
    require 'yookassa'

    Yookassa.configure do |config|
      config.shop_id = ENV['YOOKASSA_SHOP_ID']
      config.secret_key = ENV['YOOKASSA_SECRET_KEY']
    end

    Yookassa
  end
end

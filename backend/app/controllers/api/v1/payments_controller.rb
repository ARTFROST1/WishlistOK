module Api
  module V1
    class PaymentsController < BaseController
      before_action :authenticate_user!
      before_action :set_wish, only: [:create]
      before_action :set_payment, only: [:show, :refund]

      # GET /api/v1/payments
      # Get user's payment history
      def index
        @payments = current_user.payments
                                .includes(:wish, :claim)
                                .order(created_at: :desc)
                                .page(params[:page])
                                .per(params[:per_page] || 20)

        render_success(
          data: PaymentSerializer.new(@payments).serializable_hash,
          meta: pagination_meta(@payments)
        )
      end

      # GET /api/v1/payments/:id
      # Get payment details
      def show
        render_success(
          data: PaymentSerializer.new(@payment).serializable_hash
        )
      end

      # POST /api/v1/wishes/:wish_id/contribute
      # Create a contribution payment for a wish
      def create
        amount = payment_params[:amount].to_f
        currency = payment_params[:currency] || 'RUB'

        service = PaymentService.new(
          user: current_user,
          wish: @wish,
          amount: amount,
          currency: currency
        )

        @payment = service.create_payment

        render_success(
          data: PaymentSerializer.new(@payment).serializable_hash,
          message: 'Payment created successfully'
        )
      rescue PaymentService::PaymentError => e
        render_error(e.message, :unprocessable_entity)
      rescue StandardError => e
        Rails.logger.error("Payment creation error: #{e.message}\n#{e.backtrace.join("\n")}")
        render_error('Failed to create payment', :internal_server_error)
      end

      # POST /api/v1/payments/:id/refund
      # Refund a payment
      def refund
        authorize_payment_owner!

        amount = params[:amount]&.to_f
        refunded_payment = PaymentService.refund_payment(@payment, amount: amount)

        render_success(
          data: PaymentSerializer.new(refunded_payment).serializable_hash,
          message: 'Payment refunded successfully'
        )
      rescue PaymentService::PaymentError => e
        render_error(e.message, :unprocessable_entity)
      rescue StandardError => e
        Rails.logger.error("Payment refund error: #{e.message}")
        render_error('Failed to refund payment', :internal_server_error)
      end

      # GET /api/v1/wishes/:wish_id/contributions
      # Get all contributions for a wish
      def wish_contributions
        @wish = Wish.find(params[:wish_id])
        authorize_wishlist_access!(@wish.wishlist)

        @payments = Payment.where(wish: @wish, status: :succeeded)
                           .includes(:user)
                           .order(created_at: :desc)

        # Hide contributor identities if surprise mode
        serializer_options = {}
        if @wish.claims.any?(&:is_surprise) && @wish.wishlist.user != current_user
          serializer_options[:params] = { hide_user: true }
        end

        render_success(
          data: PaymentSerializer.new(@payments, serializer_options).serializable_hash,
          meta: {
            total_contributions: @wish.total_contributions,
            target_price: @wish.price,
            progress_percentage: @wish.contribution_progress,
            fully_funded: @wish.fully_funded?
          }
        )
      end

      private

      def set_wish
        @wish = Wish.find(params[:wish_id])
      rescue ActiveRecord::RecordNotFound
        render_error('Wish not found', :not_found)
      end

      def set_payment
        @payment = Payment.find(params[:id])
      rescue ActiveRecord::RecordNotFound
        render_error('Payment not found', :not_found)
      end

      def authorize_payment_owner!
        unless @payment.user == current_user || @payment.wish.wishlist.user == current_user
          render_error('Not authorized', :forbidden)
        end
      end

      def payment_params
        params.require(:payment).permit(:amount, :currency, :payment_method)
      end
    end
  end
end

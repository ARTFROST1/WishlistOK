module Api
  module V1
    class WebhooksController < ActionController::API
      skip_before_action :verify_authenticity_token
      before_action :verify_webhook_signature, only: [:yookassa, :cloudpayments]

      # POST /api/v1/webhooks/yookassa
      def yookassa
        payload = JSON.parse(request.body.read)

        PaymentService.process_webhook(:yookassa, payload)

        head :ok
      rescue JSON::ParserError => e
        Rails.logger.error("YooKassa webhook JSON parse error: #{e.message}")
        head :bad_request
      rescue StandardError => e
        Rails.logger.error("YooKassa webhook processing error: #{e.message}")
        head :internal_server_error
      end

      # POST /api/v1/webhooks/cloudpayments
      def cloudpayments
        payload = JSON.parse(request.body.read)

        PaymentService.process_webhook(:cloudpayments, payload)

        render json: { code: 0 } # CloudPayments expects { code: 0 } for success
      rescue JSON::ParserError => e
        Rails.logger.error("CloudPayments webhook JSON parse error: #{e.message}")
        render json: { code: 13 }, status: :bad_request
      rescue StandardError => e
        Rails.logger.error("CloudPayments webhook processing error: #{e.message}")
        render json: { code: 13 }, status: :internal_server_error
      end

      private

      def verify_webhook_signature
        case action_name
        when 'yookassa'
          verify_yookassa_signature
        when 'cloudpayments'
          verify_cloudpayments_signature
        end
      end

      def verify_yookassa_signature
        # YooKassa webhook signature verification
        # The signature is in the HTTP_AUTHORIZATION header
        # Format: "Basic <base64(shop_id:notification_secret)>"

        return if Rails.env.development? # Skip in development

        auth_header = request.headers['HTTP_AUTHORIZATION']

        unless auth_header
          Rails.logger.warn("YooKassa webhook: Missing authorization header")
          head :unauthorized
          return
        end

        # Decode and verify
        begin
          decoded = Base64.strict_decode64(auth_header.split(' ').last)
          shop_id, notification_secret = decoded.split(':')

          expected_shop_id = ENV['YOOKASSA_SHOP_ID']
          expected_secret = ENV['YOOKASSA_NOTIFICATION_SECRET']

          unless shop_id == expected_shop_id && notification_secret == expected_secret
            Rails.logger.warn("YooKassa webhook: Invalid credentials")
            head :unauthorized
            return
          end
        rescue StandardError => e
          Rails.logger.error("YooKassa signature verification error: #{e.message}")
          head :unauthorized
          return
        end
      end

      def verify_cloudpayments_signature
        # CloudPayments uses HMAC-SHA256
        return if Rails.env.development? # Skip in development

        signature = request.headers['HTTP_CONTENT_HMAC']

        unless signature
          Rails.logger.warn("CloudPayments webhook: Missing signature")
          head :unauthorized
          return
        end

        body = request.body.read
        request.body.rewind

        secret = ENV['CLOUDPAYMENTS_SECRET']
        expected_signature = Base64.strict_encode64(
          OpenSSL::HMAC.digest('SHA256', secret, body)
        )

        unless signature == expected_signature
          Rails.logger.warn("CloudPayments webhook: Invalid signature")
          head :unauthorized
          return
        end
      end
    end
  end
end

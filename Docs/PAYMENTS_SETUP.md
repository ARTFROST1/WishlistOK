# Payments & Donations Setup Guide

This guide explains how to set up the payment processing functionality for WishApp.

## Overview

WishApp supports group gifts and donations through payment provider integrations:
- **YooKassa** (Yandex.Checkout) - Primary provider for Russian market
- **CloudPayments** - Alternative provider (implementation placeholder)

## Features

- **Group Gifts**: Multiple users can contribute towards a single wish
- **Progress Tracking**: Visual progress bars showing funding progress
- **Secure Payments**: PCI-compliant payment processing through providers
- **Webhook Integration**: Automatic payment confirmation
- **Refund Support**: Payment refunds within 30 days

## Backend Setup

### 1. Install Dependencies

Add to `backend/Gemfile`:
```ruby
gem "yookassa", "~> 0.4"
```

Then run:
```bash
cd backend
bundle install
```

### 2. Database Migration

Run the payments migration:
```bash
bundle exec rails db:migrate
```

This creates the `payments` table with fields for:
- Payment provider details
- Amount and currency
- Payment status
- Provider responses
- Refund tracking

### 3. Environment Variables

Add the following to your `.env` file in the `backend/` directory:

```bash
# YooKassa Configuration
YOOKASSA_SHOP_ID=your_shop_id_here
YOOKASSA_SECRET_KEY=your_secret_key_here
YOOKASSA_NOTIFICATION_SECRET=your_notification_secret_here

# Frontend URL for payment redirects
FRONTEND_URL=http://localhost:3000

# CloudPayments (optional)
CLOUDPAYMENTS_PUBLIC_ID=your_public_id_here
CLOUDPAYMENTS_SECRET=your_api_secret_here
```

### 4. Obtain YooKassa Credentials

1. Register at [YooKassa](https://yookassa.ru/)
2. Create a shop in the merchant dashboard
3. Get credentials:
   - **Shop ID**: Found in shop settings
   - **Secret Key**: Generated in API settings
   - **Notification Secret**: Set up in webhook settings

### 5. Configure Webhooks

Set up webhook endpoints in YooKassa dashboard:

**Webhook URL**: `https://your-domain.com/api/v1/webhooks/yookassa`

**Events to subscribe**:
- `payment.succeeded` - Payment completed successfully
- `payment.canceled` - Payment canceled
- `refund.succeeded` - Refund completed

**Authentication**:
- Use HTTP Basic Auth with Shop ID and Notification Secret

## Flutter App Setup

### 1. Install Dependencies

The following packages are required (already in `pubspec.yaml`):
```yaml
dependencies:
  url_launcher: ^6.3.1  # For opening payment URLs
  freezed_annotation: ^2.4.4
  json_annotation: ^4.9.0
```

### 2. Code Generation

Run code generation for Payment models:
```bash
cd app
dart run build_runner build --delete-conflicting-outputs
```

### 3. Usage in App

#### Display Contribution Progress

```dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wishapp/features/payments/application/payments_provider.dart';
import 'package:wishapp/features/payments/presentation/widgets/contribution_progress_card.dart';

class WishDetailScreen extends ConsumerWidget {
  final int wishId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contributionsAsync = ref.watch(wishContributionsProvider(wishId));

    return contributionsAsync.when(
      data: (contributionResponse) => ContributionProgressCard(
        stats: contributionResponse.stats,
        targetPrice: wish.price!,
        currency: wish.currency ?? 'RUB',
        recentContributions: contributionResponse.contributions,
        onContribute: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => ContributeModal(
              wish: wish,
              stats: contributionResponse.stats,
            ),
          );
        },
      ),
      loading: () => CircularProgressIndicator(),
      error: (error, stack) => Text('Error: $error'),
    );
  }
}
```

#### Open Contribution Modal

```dart
import 'package:wishapp/features/payments/presentation/widgets/contribute_modal.dart';

void _showContributeModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) => ContributeModal(
      wish: wish,
      stats: stats,
    ),
  );
}
```

## API Endpoints

### Create Contribution

```
POST /api/v1/wishes/:wish_id/contribute
```

**Request**:
```json
{
  "payment": {
    "amount": 1000.00,
    "currency": "RUB",
    "payment_method": "bank_card"
  }
}
```

**Response**:
```json
{
  "success": true,
  "data": {
    "id": 123,
    "amount": 1000.00,
    "currency": "RUB",
    "status": "pending",
    "confirmation_url": "https://yookassa.ru/checkout/..."
  }
}
```

### Get Wish Contributions

```
GET /api/v1/wishes/:wish_id/contributions
```

**Response**:
```json
{
  "success": true,
  "data": [
    {
      "id": 123,
      "amount": 1000.00,
      "formatted_amount": "₽1000.00",
      "contributor": {
        "id": 456,
        "name": "John Doe"
      }
    }
  ],
  "meta": {
    "total_contributions": 2500.00,
    "target_price": 5000.00,
    "progress_percentage": 50.0,
    "fully_funded": false
  }
}
```

### Payment History

```
GET /api/v1/payments
```

Returns list of user's payments with pagination.

### Refund Payment

```
POST /api/v1/payments/:id/refund
```

**Request** (optional partial refund):
```json
{
  "amount": 500.00
}
```

## Payment Flow

1. **User initiates contribution**
   - Opens ContributeModal
   - Enters amount
   - Clicks "Continue to Payment"

2. **Backend creates payment**
   - Creates Payment record
   - Calls YooKassa API
   - Returns confirmation URL

3. **User completes payment**
   - Opens confirmation URL in browser
   - Enters card details on YooKassa page
   - Completes payment

4. **Webhook processes confirmation**
   - YooKassa sends webhook to `/api/v1/webhooks/yookassa`
   - Backend verifies signature
   - Updates Payment status to `succeeded`
   - Updates Claim contribution_amount
   - Updates Wish status if fully funded

5. **User returns to app**
   - Sees updated progress
   - Contribution is recorded

## Security Considerations

### Webhook Signature Verification

All webhooks are verified using HTTP Basic Auth:
```ruby
# Signature format: Basic base64(shop_id:notification_secret)
decoded = Base64.decode64(auth_header)
shop_id, secret = decoded.split(':')
```

### PCI Compliance

- Never store card details
- All payments processed on provider's secure page
- App only stores payment metadata and status

### API Authentication

- All payment endpoints require JWT authentication
- Users can only view their own payments
- Wishlist owners can view contributions to their wishes

## Testing

### Test Mode

YooKassa provides test mode:
1. Use test credentials in development
2. Test cards available in [YooKassa docs](https://yookassa.ru/developers/payment-acceptance/testing-and-going-live/testing)

Example test card:
- Number: `4111 1111 1111 1111`
- Expiry: Any future date
- CVC: Any 3 digits

### Local Testing with ngrok

To test webhooks locally:

1. Install ngrok: `npm install -g ngrok`
2. Start your backend: `rails server -p 3001`
3. Create tunnel: `ngrok http 3001`
4. Configure webhook URL in YooKassa: `https://your-id.ngrok.io/api/v1/webhooks/yookassa`

## Troubleshooting

### Payment not confirming

1. Check webhook logs in YooKassa dashboard
2. Verify webhook URL is accessible
3. Check signature verification in logs
4. Ensure notification secret matches

### Contribution not updating

1. Check Payment record status
2. Verify webhook was received
3. Check Claim contribution_amount
4. Review application logs

### Invalid payment amount

- Ensure amount is positive
- Check currency matches wish currency
- Verify user is not wish owner

## Production Deployment

1. **Enable production mode** in YooKassa
2. **Configure HTTPS** for webhook endpoints
3. **Set up monitoring** for failed payments
4. **Configure error alerts** for webhook failures
5. **Test refund flow** end-to-end
6. **Document** payment provider credentials in secure vault

## Support

- YooKassa Documentation: https://yookassa.ru/developers/
- YooKassa Support: support@yookassa.ru
- CloudPayments Documentation: https://developers.cloudpayments.ru/

## Future Enhancements

- Apple Pay / Google Pay support
- Recurring contributions
- Payment reminders
- Contribution analytics
- Multi-currency support with conversion
- Alternative payment methods (SBP, YooMoney, etc.)

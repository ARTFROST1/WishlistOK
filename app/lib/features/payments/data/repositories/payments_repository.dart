import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/network/api_client.dart';
import '../../../../core/models/payment.dart';

class PaymentsRepository {
  final Dio _dio;

  PaymentsRepository(this._dio);

  // Get user's payment history
  Future<List<Payment>> getPayments({
    int page = 1,
    int perPage = 20,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/payments',
        queryParameters: {
          'page': page,
          'per_page': perPage,
        },
      );

      final List<dynamic> paymentsData =
          (response.data!['data'] as List<dynamic>?) ?? [];
      return paymentsData
          .map((json) => Payment.fromJson(json['attributes'] as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  // Get payment details
  Future<Payment> getPayment(int id) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/payments/$id');
      return Payment.fromJson(
        response.data!['data']['attributes'] as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  // Create a contribution for a wish
  Future<Payment> contribute({
    required int wishId,
    required double amount,
    String currency = 'RUB',
    String? paymentMethod,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/wishes/$wishId/contribute',
        data: {
          'payment': {
            'amount': amount,
            'currency': currency,
            if (paymentMethod != null) 'payment_method': paymentMethod,
          },
        },
      );

      return Payment.fromJson(
        response.data!['data']['attributes'] as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  // Get contributions for a wish
  Future<ContributionResponse> getWishContributions(int wishId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/wishes/$wishId/contributions',
      );

      final List<dynamic> paymentsData =
          (response.data!['data'] as List<dynamic>?) ?? [];
      final payments = paymentsData
          .map((json) => Payment.fromJson(json['attributes'] as Map<String, dynamic>))
          .toList();

      final stats = ContributionStats.fromJson(
        response.data!['meta'] as Map<String, dynamic>,
      );

      return ContributionResponse(
        contributions: payments,
        stats: stats,
      );
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }

  // Refund a payment
  Future<Payment> refundPayment(int paymentId, {double? amount}) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/payments/$paymentId/refund',
        data: amount != null ? {'amount': amount} : null,
      );

      return Payment.fromJson(
        response.data!['data']['attributes'] as Map<String, dynamic>,
      );
    } on DioException catch (e) {
      throw ApiException.fromDioError(e);
    }
  }
}

// Provider
final paymentsRepositoryProvider = Provider<PaymentsRepository>((ref) {
  return PaymentsRepository(ApiClient().dio);
});

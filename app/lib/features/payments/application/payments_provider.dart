import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/payment.dart';
import '../data/repositories/payments_repository.dart';

// Get payment history
final paymentsProvider = FutureProvider.autoDispose<List<Payment>>((ref) async {
  final repository = ref.read(paymentsRepositoryProvider);
  return repository.getPayments();
});

// Get contributions for a specific wish
final wishContributionsProvider =
    FutureProvider.autoDispose.family<ContributionResponse, int>((ref, wishId) async {
  final repository = ref.read(paymentsRepositoryProvider);
  return repository.getWishContributions(wishId);
});

// Payment controller for creating contributions
class PaymentController extends StateNotifier<AsyncValue<Payment?>> {
  final PaymentsRepository _repository;

  PaymentController(this._repository) : super(const AsyncValue.data(null));

  Future<Payment?> contribute({
    required int wishId,
    required double amount,
    String currency = 'RUB',
    String? paymentMethod,
  }) async {
    state = const AsyncValue.loading();

    try {
      final payment = await _repository.contribute(
        wishId: wishId,
        amount: amount,
        currency: currency,
        paymentMethod: paymentMethod,
      );

      state = AsyncValue.data(payment);
      return payment;
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      rethrow;
    }
  }

  void reset() {
    state = const AsyncValue.data(null);
  }
}

final paymentControllerProvider =
    StateNotifierProvider<PaymentController, AsyncValue<Payment?>>((ref) {
  final repository = ref.read(paymentsRepositoryProvider);
  return PaymentController(repository);
});

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/wish.dart';
import '../data/repositories/wishes_repository.dart';

// Wishes by wishlist provider
final wishesProvider = FutureProvider.family<List<Wish>, int>((ref, wishlistId) async {
  final repository = ref.read(wishesRepositoryProvider);
  return repository.getWishesByWishlist(wishlistId);
});

// Single wish provider
final wishProvider = FutureProvider.family<Wish, int>((ref, id) async {
  final repository = ref.read(wishesRepositoryProvider);
  return repository.getWish(id);
});

// Wish actions provider
final wishActionsProvider = Provider<WishActions>((ref) {
  final repository = ref.read(wishesRepositoryProvider);
  return WishActions(repository, ref);
});

class WishActions {
  final WishesRepository _repository;
  final Ref _ref;

  WishActions(this._repository, this._ref);

  Future<ParseWishResponse> parseWish(String url) async {
    return _repository.parseWish(url);
  }

  Future<Wish> createWish(CreateWishRequest request) async {
    final wish = await _repository.createWish(request);
    
    // Refresh wishes for this wishlist
    _ref.invalidate(wishesProvider(request.wishlistId));
    
    return wish;
  }

  Future<Wish> updateWish(int id, CreateWishRequest request) async {
    final wish = await _repository.updateWish(id, request);
    
    // Refresh both the specific wish and the wishlist's wishes
    _ref.invalidate(wishProvider(id));
    _ref.invalidate(wishesProvider(request.wishlistId));
    
    return wish;
  }

  Future<void> deleteWish(int id, int wishlistId) async {
    await _repository.deleteWish(id);
    
    // Refresh the wishlist's wishes
    _ref.invalidate(wishesProvider(wishlistId));
  }

  void refreshWishes(int wishlistId) {
    _ref.invalidate(wishesProvider(wishlistId));
  }

  void refreshWish(int id) {
    _ref.invalidate(wishProvider(id));
  }
}

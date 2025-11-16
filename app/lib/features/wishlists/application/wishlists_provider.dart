import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/models/wishlist.dart';
import '../data/repositories/wishlists_repository.dart';

// Wishlists provider (for user's own wishlists)
final wishlistsProvider = FutureProvider<List<Wishlist>>((ref) async {
  final repository = ref.read(wishlistsRepositoryProvider);
  final response = await repository.getWishlists();
  return response.wishlists;
});

// Single wishlist provider
final wishlistProvider = FutureProvider.family<Wishlist, int>((ref, id) async {
  final repository = ref.read(wishlistsRepositoryProvider);
  return repository.getWishlist(id);
});

// Public wishlist provider (by slug)
final publicWishlistProvider = FutureProvider.family<Wishlist, String>((ref, slug) async {
  final repository = ref.read(wishlistsRepositoryProvider);
  return repository.getWishlistBySlug(slug);
});

// Wishlist actions provider
final wishlistActionsProvider = Provider<WishlistActions>((ref) {
  final repository = ref.read(wishlistsRepositoryProvider);
  return WishlistActions(repository, ref);
});

class WishlistActions {
  final WishlistsRepository _repository;
  final Ref _ref;

  WishlistActions(this._repository, this._ref);

  Future<Wishlist> createWishlist(CreateWishlistRequest request) async {
    final wishlist = await _repository.createWishlist(request);
    
    // Refresh the wishlists list
    _ref.invalidate(wishlistsProvider);
    
    return wishlist;
  }

  Future<Wishlist> updateWishlist(int id, CreateWishlistRequest request) async {
    final wishlist = await _repository.updateWishlist(id, request);
    
    // Refresh the specific wishlist and list
    _ref.invalidate(wishlistProvider(id));
    _ref.invalidate(wishlistsProvider);
    
    return wishlist;
  }

  Future<void> deleteWishlist(int id) async {
    await _repository.deleteWishlist(id);
    
    // Refresh the wishlists list
    _ref.invalidate(wishlistsProvider);
  }

  Future<Map<String, String>> getShareUrls(int id) async {
    return _repository.getShareUrls(id);
  }

  void refreshWishlists() {
    _ref.invalidate(wishlistsProvider);
  }

  void refreshWishlist(int id) {
    _ref.invalidate(wishlistProvider(id));
  }
}

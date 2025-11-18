import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';

class WishlistDetailScreen extends StatefulWidget {
  final int? wishlistId;
  final String? slug;
  final bool isPublicView;

  const WishlistDetailScreen({
    super.key,
    this.wishlistId,
    this.slug,
    this.isPublicView = false,
  });

  @override
  State<WishlistDetailScreen> createState() => _WishlistDetailScreenState();
}

class _WishlistDetailScreenState extends State<WishlistDetailScreen> {
  // Mock data - will be replaced with actual API calls
  final Map<String, dynamic> _mockWishlist = {
    'id': 1,
    'title': 'Birthday Wishlist 2024',
    'description': 'My 25th birthday coming up!',
    'eventDate': DateTime(2024, 12, 15),
    'visibility': 'link_only',
    'shareUrl': 'https://wishapp.com/p/birthday-2024-abc123',
  };

  final List<Map<String, dynamic>> _mockWishes = [
    {
      'id': 1,
      'title': 'Wireless Headphones',
      'imageUrl': 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400',
      'price': 299.99,
      'currency': 'USD',
      'status': 'available',
      'canClaim': true,
    },
    {
      'id': 2,
      'title': 'Smart Watch',
      'imageUrl': 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400',
      'price': 249.99,
      'currency': 'USD',
      'status': 'claimed',
      'canClaim': false,
    },
    {
      'id': 3,
      'title': 'Running Shoes',
      'imageUrl': 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
      'price': 129.00,
      'currency': 'USD',
      'status': 'available',
      'canClaim': true,
    },
    {
      'id': 4,
      'title': 'Backpack',
      'imageUrl': 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400',
      'price': 89.99,
      'currency': 'USD',
      'status': 'available',
      'canClaim': true,
    },
    {
      'id': 5,
      'title': 'Sunglasses',
      'imageUrl': 'https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=400',
      'price': 159.00,
      'currency': 'USD',
      'status': 'available',
      'canClaim': true,
    },
    {
      'id': 6,
      'title': 'Coffee Machine',
      'imageUrl': null,
      'price': 199.00,
      'currency': 'USD',
      'status': 'available',
      'canClaim': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_mockWishlist['title']),
        actions: [
          if (!widget.isPublicView) ...[
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // TODO: Navigate to edit
              },
            ),
          ],
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: _handleShare,
          ),
        ],
      ),
      body: _mockWishes.isEmpty
          ? _buildEmptyState()
          : CustomScrollView(
              slivers: [
                // Header info
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(AppTheme.spacing16),
                    child: _buildHeader(),
                  ),
                ),

                // Wishes grid
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.spacing16,
                  ),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: AppTheme.spacing12,
                      mainAxisSpacing: AppTheme.spacing12,
                      childAspectRatio: 0.75,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final wish = _mockWishes[index];
                        return _WishCard(
                          wish: wish,
                          isPublicView: widget.isPublicView,
                          onTap: () => context.go('/wishes/${wish['id']}'),
                        );
                      },
                      childCount: _mockWishes.length,
                    ),
                  ),
                ),

                // Bottom padding
                const SliverToBoxAdapter(child: SizedBox(height: 100)),
              ],
            ),
      floatingActionButton: !widget.isPublicView
          ? FloatingActionButton.extended(
              onPressed: () =>
                  context.go('/wishlists/${_mockWishlist['id']}/add-wish'),
              icon: const Icon(Icons.add),
              label: const Text('Add Wish'),
            )
          : null,
    );
  }

  Widget _buildHeader() {
    final eventDate = _mockWishlist['eventDate'] as DateTime;
    final daysLeft = eventDate.difference(DateTime.now()).inDays;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_mockWishlist['description'] != null) ...[
          Text(
            _mockWishlist['description'],
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: AppTheme.spacing12),
        ],
        Row(
          children: [
            Icon(Icons.event, size: 18, color: Colors.grey[600]),
            const SizedBox(width: AppTheme.spacing8),
            Text(
              '${eventDate.day}/${eventDate.month}/${eventDate.year}',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
            if (daysLeft >= 0) ...[
              const SizedBox(width: AppTheme.spacing12),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: (daysLeft <= 7
                          ? AppTheme.warningColor
                          : AppTheme.successColor)
                      .withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  daysLeft == 0
                      ? 'Today!'
                      : daysLeft == 1
                          ? 'Tomorrow'
                          : '$daysLeft days',
                  style: TextStyle(
                    color: daysLeft <= 7
                        ? AppTheme.warningColor
                        : AppTheme.successColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacing32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.card_giftcard_outlined,
              size: 64,
              color: Colors.grey,
            ),
            const SizedBox(height: AppTheme.spacing16),
            Text(
              'No wishes yet',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.grey,
                  ),
            ),
            const SizedBox(height: AppTheme.spacing8),
            Text(
              widget.isPublicView
                  ? 'This wishlist is empty'
                  : 'Add your first wish to get started',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleShare() {
    // TODO: Implement sharing functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Share link: ${_mockWishlist['shareUrl']}'),
        action: SnackBarAction(
          label: 'Copy',
          onPressed: () {
            // TODO: Copy to clipboard
          },
        ),
      ),
    );
  }
}

class _WishCard extends StatelessWidget {
  final Map<String, dynamic> wish;
  final bool isPublicView;
  final VoidCallback onTap;

  const _WishCard({
    required this.wish,
    required this.isPublicView,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isAvailable = wish['status'] == 'available';
    final imageUrl = wish['imageUrl'] as String?;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppTheme.radius16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppTheme.radius16),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Background image or placeholder
              if (imageUrl != null)
                Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      _buildPlaceholder(),
                )
              else
                _buildPlaceholder(),

              // Claimed overlay
              if (!isAvailable)
                Container(
                  color: Colors.black.withOpacity(0.4),
                ),

              // Gradient overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.8),
                    ],
                    stops: const [0.5, 1.0],
                  ),
                ),
              ),

              // Status badge (top right)
              if (!isAvailable)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'Claimed',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

              // Claim button for public view
              if (isPublicView && wish['canClaim'] == true && isAvailable)
                Positioned(
                  top: 8,
                  right: 8,
                  child: Material(
                    color: AppTheme.primaryColor,
                    borderRadius: BorderRadius.circular(6),
                    child: InkWell(
                      onTap: () => _handleClaim(context),
                      borderRadius: BorderRadius.circular(6),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        child: Text(
                          'Claim',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              // Content at bottom
              Positioned(
                left: 10,
                right: 10,
                bottom: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title
                    Text(
                      wish['title'],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                        decoration:
                            isAvailable ? null : TextDecoration.lineThrough,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 4),

                    // Price
                    if (wish['price'] != null)
                      Text(
                        '\$${wish['price'].toStringAsFixed(0)}',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey[300],
      child: const Center(
        child: Icon(
          Icons.image_outlined,
          size: 40,
          color: Colors.grey,
        ),
      ),
    );
  }

  void _handleClaim(BuildContext context) {
    // TODO: Implement claim functionality
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Claimed "${wish['title']}"'),
        backgroundColor: AppTheme.successColor,
      ),
    );
  }
}

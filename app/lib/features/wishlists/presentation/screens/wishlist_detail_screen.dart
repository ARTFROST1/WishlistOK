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
    'description': 'My 25th birthday coming up! 🎉',
    'eventDate': DateTime(2024, 12, 15),
    'visibility': 'link_only',
    'shareUrl': 'https://wishapp.com/p/birthday-2024-abc123',
  };

  final List<Map<String, dynamic>> _mockWishes = [
    {
      'id': 1,
      'title': 'Wireless Noise-Cancelling Headphones',
      'description': 'Perfect for work and travel',
      'imageUrl': null,
      'price': 299.99,
      'currency': 'USD',
      'productUrl': 'https://example.com/headphones',
      'status': 'available',
      'canClaim': true,
    },
    {
      'id': 2,
      'title': 'Smart Fitness Watch',
      'description': 'Track workouts and health metrics',
      'imageUrl': null,
      'price': 249.99,
      'currency': 'USD',
      'productUrl': 'https://example.com/watch',
      'status': 'claimed',
      'canClaim': false,
    },
    {
      'id': 3,
      'title': 'Coffee Table Book - Photography',
      'description': 'Beautiful landscape photography collection',
      'imageUrl': null,
      'price': 45.00,
      'currency': 'USD',
      'productUrl': 'https://example.com/book',
      'status': 'available',
      'canClaim': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final availableWishes = _mockWishes.where((w) => w['status'] == 'available').toList();
    final claimedWishes = _mockWishes.where((w) => w['status'] != 'available').toList();

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
      body: CustomScrollView(
        slivers: [
          // Header info
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppTheme.spacing16),
              child: _buildHeader(),
            ),
          ),
          
          // Available wishes
          if (availableWishes.isNotEmpty) ...[
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacing16),
                child: Row(
                  children: [
                    const Icon(Icons.card_giftcard, color: AppTheme.successColor),
                    const SizedBox(width: AppTheme.spacing8),
                    Text(
                      'Available (${availableWishes.length})',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: AppTheme.spacing8)),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.spacing16,
                    vertical: AppTheme.spacing4,
                  ),
                  child: _WishCard(
                    wish: availableWishes[index],
                    isPublicView: widget.isPublicView,
                  ),
                ),
                childCount: availableWishes.length,
              ),
            ),
          ],
          
          // Claimed wishes
          if (claimedWishes.isNotEmpty) ...[
            const SliverToBoxAdapter(child: SizedBox(height: AppTheme.spacing24)),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacing16),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle, color: AppTheme.primaryColor),
                    const SizedBox(width: AppTheme.spacing8),
                    Text(
                      'Claimed (${claimedWishes.length})',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: AppTheme.spacing8)),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.spacing16,
                    vertical: AppTheme.spacing4,
                  ),
                  child: _WishCard(
                    wish: claimedWishes[index],
                    isPublicView: widget.isPublicView,
                  ),
                ),
                childCount: claimedWishes.length,
              ),
            ),
          ],
          
          // Empty state
          if (_mockWishes.isEmpty)
            SliverFillRemaining(
              child: _buildEmptyState(),
            ),
            
          // Bottom padding
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
      floatingActionButton: !widget.isPublicView 
          ? FloatingActionButton.extended(
              onPressed: () => context.go('/wishlists/${_mockWishlist['id']}/add-wish'),
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
          const SizedBox(height: AppTheme.spacing16),
        ],
        
        Row(
          children: [
            const Icon(Icons.event, color: AppTheme.primaryColor),
            const SizedBox(width: AppTheme.spacing8),
            Text(
              '${eventDate.day}/${eventDate.month}/${eventDate.year}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(width: AppTheme.spacing16),
            if (daysLeft >= 0) ...[
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacing8,
                  vertical: AppTheme.spacing4,
                ),
                decoration: BoxDecoration(
                  color: (daysLeft <= 7 ? AppTheme.warningColor : AppTheme.successColor).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppTheme.radius8),
                ),
                child: Text(
                  daysLeft == 0 
                      ? 'Today!' 
                      : daysLeft == 1 
                          ? 'Tomorrow'
                          : '$daysLeft days left',
                  style: TextStyle(
                    color: daysLeft <= 7 ? AppTheme.warningColor : AppTheme.successColor,
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

  const _WishCard({
    required this.wish,
    required this.isPublicView,
  });

  @override
  Widget build(BuildContext context) {
    final isAvailable = wish['status'] == 'available';
    
    return Card(
      child: InkWell(
        onTap: () => context.go('/wishes/${wish['id']}'),
        borderRadius: BorderRadius.circular(AppTheme.radius12),
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacing12),
          child: Row(
            children: [
              // Image placeholder
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(AppTheme.radius8),
                ),
                child: const Icon(
                  Icons.image,
                  color: Colors.grey,
                ),
              ),
              
              const SizedBox(width: AppTheme.spacing12),
              
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      wish['title'],
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        decoration: isAvailable ? null : TextDecoration.lineThrough,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    if (wish['description'] != null) ...[
                      const SizedBox(height: AppTheme.spacing4),
                      Text(
                        wish['description'],
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey[600],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                    
                    const SizedBox(height: AppTheme.spacing8),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (wish['price'] != null)
                          Text(
                            '\$${wish['price'].toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: AppTheme.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        
                        if (isPublicView && wish['canClaim'] && isAvailable)
                          ElevatedButton(
                            onPressed: () => _handleClaim(context),
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(60, 32),
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                            ),
                            child: const Text('Claim', style: TextStyle(fontSize: 12)),
                          )
                        else if (!isAvailable)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppTheme.spacing8,
                              vertical: AppTheme.spacing4,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(AppTheme.radius8),
                            ),
                            child: Text(
                              'Claimed',
                              style: TextStyle(
                                color: AppTheme.primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                      ],
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

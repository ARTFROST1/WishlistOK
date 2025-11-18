import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';

class WishlistsScreen extends StatefulWidget {
  const WishlistsScreen({super.key});

  @override
  State<WishlistsScreen> createState() => _WishlistsScreenState();
}

class _WishlistsScreenState extends State<WishlistsScreen> {
  final List<Map<String, dynamic>> _mockWishlists = [
    {
      'id': 1,
      'title': 'Birthday Wishlist 2024',
      'wishesCount': 8,
      'coverImageUrl': 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400',
      'visibility': 'link_only',
    },
    {
      'id': 2,
      'title': 'Wedding Registry',
      'wishesCount': 15,
      'coverImageUrl': 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400',
      'visibility': 'public',
    },
    {
      'id': 3,
      'title': 'Christmas 2024',
      'wishesCount': 6,
      'coverImageUrl': 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=400',
      'visibility': 'private',
    },
    {
      'id': 4,
      'title': 'Home Office Setup',
      'wishesCount': 4,
      'coverImageUrl': null,
      'visibility': 'private',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wishlists'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search
            },
          ),
        ],
      ),
      body: _mockWishlists.isEmpty ? _buildEmptyState() : _buildWishlistsGrid(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go('/create'),
        icon: const Icon(Icons.add),
        label: const Text('Create List'),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacing32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(AppTheme.radius12),
              ),
              child: Icon(
                Icons.list_alt_outlined,
                size: 64,
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(height: AppTheme.spacing24),
            Text(
              'No Wishlists Yet',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: AppTheme.spacing8),
            Text(
              'Create your first wishlist to start collecting and sharing your favorite items',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey[600],
                  ),
            ),
            const SizedBox(height: AppTheme.spacing32),
            ElevatedButton.icon(
              onPressed: () => context.go('/create'),
              icon: const Icon(Icons.add),
              label: const Text('Create Your First List'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWishlistsGrid() {
    return Padding(
      padding: const EdgeInsets.all(AppTheme.spacing16),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: AppTheme.spacing12,
          mainAxisSpacing: AppTheme.spacing12,
          childAspectRatio: 0.8,
        ),
        itemCount: _mockWishlists.length,
        itemBuilder: (context, index) {
          final wishlist = _mockWishlists[index];
          return _WishlistCard(
            wishlist: wishlist,
            onTap: () => context.go('/wishlists/${wishlist['id']}'),
          );
        },
      ),
    );
  }
}

class _WishlistCard extends StatelessWidget {
  final Map<String, dynamic> wishlist;
  final VoidCallback onTap;

  const _WishlistCard({
    required this.wishlist,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = wishlist['coverImageUrl'] as String?;

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

              // Gradient overlay
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.7),
                    ],
                    stops: const [0.4, 1.0],
                  ),
                ),
              ),

              // Visibility icon (top right)
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: _buildVisibilityIcon(wishlist['visibility']),
                ),
              ),

              // Content at bottom
              Positioned(
                left: 12,
                right: 12,
                bottom: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title
                    Text(
                      wishlist['title'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: 4),

                    // Wishes count
                    Text(
                      '${wishlist['wishesCount']} wishes',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 12,
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
      color: AppTheme.primaryColor.withOpacity(0.3),
      child: const Center(
        child: Icon(
          Icons.card_giftcard,
          size: 48,
          color: Colors.white54,
        ),
      ),
    );
  }

  Widget _buildVisibilityIcon(String visibility) {
    IconData icon;

    switch (visibility) {
      case 'public':
        icon = Icons.public;
        break;
      case 'private':
        icon = Icons.lock;
        break;
      default:
        icon = Icons.link;
    }

    return Icon(icon, size: 16, color: Colors.white);
  }
}

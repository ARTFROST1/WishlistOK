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
      'eventDate': DateTime(2024, 12, 15),
      'wishesCount': 8,
      'availableCount': 5,
      'claimedCount': 3,
      'visibility': 'link_only',
    },
    {
      'id': 2,
      'title': 'Wedding Registry',
      'eventDate': DateTime(2024, 6, 20),
      'wishesCount': 15,
      'availableCount': 12,
      'claimedCount': 3,
      'visibility': 'public',
    },
    {
      'id': 3,
      'title': 'Christmas 2024',
      'eventDate': DateTime(2024, 12, 25),
      'wishesCount': 6,
      'availableCount': 6,
      'claimedCount': 0,
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
          childAspectRatio: 0.75,
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
    final eventDate = wishlist['eventDate'] as DateTime;
    final daysLeft = eventDate.difference(DateTime.now()).inDays;
    
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppTheme.radius12),
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacing12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with visibility icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildVisibilityIcon(wishlist['visibility']),
                  IconButton(
                    icon: const Icon(Icons.more_vert, size: 16),
                    onPressed: () {
                      // TODO: Show options menu
                    },
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
              
              const SizedBox(height: AppTheme.spacing8),
              
              // Title
              Text(
                wishlist['title'],
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              
              const SizedBox(height: AppTheme.spacing4),
              
              // Event date and countdown
              if (daysLeft >= 0) ...[
                Text(
                  daysLeft == 0 
                      ? 'Today!' 
                      : daysLeft == 1 
                          ? 'Tomorrow'
                          : '$daysLeft days left',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: daysLeft <= 7 ? AppTheme.warningColor : Colors.grey[600],
                    fontWeight: daysLeft <= 7 ? FontWeight.w600 : null,
                  ),
                ),
              ] else ...[
                Text(
                  'Event passed',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[500],
                  ),
                ),
              ],
              
              const Spacer(),
              
              // Stats
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatChip(
                    '${wishlist['availableCount']} available',
                    AppTheme.successColor,
                  ),
                  if (wishlist['claimedCount'] > 0)
                    _buildStatChip(
                      '${wishlist['claimedCount']} claimed',
                      AppTheme.primaryColor,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVisibilityIcon(String visibility) {
    IconData icon;
    Color color;
    
    switch (visibility) {
      case 'public':
        icon = Icons.public;
        color = AppTheme.successColor;
        break;
      case 'private':
        icon = Icons.lock;
        color = AppTheme.errorColor;
        break;
      default:
        icon = Icons.link;
        color = AppTheme.primaryColor;
    }
    
    return Icon(icon, size: 16, color: color);
  }

  Widget _buildStatChip(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacing8,
        vertical: AppTheme.spacing4,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppTheme.radius8),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

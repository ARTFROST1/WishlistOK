import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/theme/app_theme.dart';

class WishDetailScreen extends StatefulWidget {
  final int wishId;

  const WishDetailScreen({super.key, required this.wishId});

  @override
  State<WishDetailScreen> createState() => _WishDetailScreenState();
}

class _WishDetailScreenState extends State<WishDetailScreen> {
  // Mock data - will be replaced with actual API calls
  final Map<String, dynamic> _mockWish = {
    'id': 1,
    'title': 'Wireless Noise-Cancelling Headphones',
    'description': 'Perfect for work, travel, and enjoying music with crystal clear sound quality. Features active noise cancellation and 30-hour battery life.',
    'imageUrl': null,
    'price': 299.99,
    'currency': 'USD',
    'productUrl': 'https://example.com/headphones',
    'status': 'available',
    'canClaim': true,
    'canEdit': false,
    'wishlistTitle': 'Birthday Wishlist 2024',
    'ownerName': 'John Doe',
    'createdAt': DateTime.now().subtract(const Duration(days: 3)),
  };

  @override
  Widget build(BuildContext context) {
    final isAvailable = _mockWish['status'] == 'available';
    final canClaim = _mockWish['canClaim'] as bool;
    final canEdit = _mockWish['canEdit'] as bool;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wish Details'),
        actions: [
          if (canEdit)
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // TODO: Navigate to edit wish
              },
            ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: _handleShare,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section
            Container(
              width: double.infinity,
              height: 300,
              color: Colors.grey[100],
              child: _mockWish['imageUrl'] != null
                  ? Image.network(
                      _mockWish['imageUrl'] as String,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          _buildImagePlaceholder(),
                    )
                  : _buildImagePlaceholder(),
            ),

            Padding(
              padding: const EdgeInsets.all(AppTheme.spacing16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Status badge
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatusBadge(),
                      if (_mockWish['price'] != null)
                        Text(
                          '\$${_mockWish['price'].toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: AppTheme.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: AppTheme.spacing16),

                  // Title
                  Text(
                    _mockWish['title'] as String,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      decoration: isAvailable ? null : TextDecoration.lineThrough,
                    ),
                  ),

                  const SizedBox(height: AppTheme.spacing8),

                  // Wishlist info
                  Row(
                    children: [
                      const Icon(Icons.list_alt, size: 16, color: Colors.grey),
                      const SizedBox(width: AppTheme.spacing4),
                      Text(
                        'From ${_mockWish['wishlistTitle']}',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),

                  if (_mockWish['description'] != null) ...[
                    const SizedBox(height: AppTheme.spacing16),
                    Text(
                      _mockWish['description'] as String,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],

                  const SizedBox(height: AppTheme.spacing24),

                  // Action buttons
                  Row(
                    children: [
                      if (_mockWish['productUrl'] != null) ...[
                        Expanded(
                          child: OutlinedButton.icon(
                            onPressed: _handleViewProduct,
                            icon: const Icon(Icons.open_in_new),
                            label: const Text('View Product'),
                          ),
                        ),
                        const SizedBox(width: AppTheme.spacing12),
                      ],
                      
                      if (canClaim && isAvailable)
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: _handleClaim,
                            icon: const Icon(Icons.card_giftcard),
                            label: const Text('Claim This'),
                          ),
                        ),
                    ],
                  ),

                  const SizedBox(height: AppTheme.spacing24),

                  // Additional info
                  _buildInfoSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.grey[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.image_outlined,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: AppTheme.spacing8),
          Text(
            'No image available',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge() {
    String text;
    Color color;
    IconData icon;

    switch (_mockWish['status']) {
      case 'claimed':
        text = 'Claimed';
        color = AppTheme.primaryColor;
        icon = Icons.check_circle;
        break;
      case 'purchased':
        text = 'Purchased';
        color = AppTheme.successColor;
        icon = Icons.shopping_bag;
        break;
      default:
        text = 'Available';
        color = AppTheme.successColor;
        icon = Icons.card_giftcard;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacing12,
        vertical: AppTheme.spacing4,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(AppTheme.radius8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          const SizedBox(width: AppTheme.spacing4),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacing16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Additional Information',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            
            const SizedBox(height: AppTheme.spacing12),

            _buildInfoRow('Added by', _mockWish['ownerName'] as String),
            _buildInfoRow('Date added', _formatDate(_mockWish['createdAt'] as DateTime)),
            if (_mockWish['currency'] != null)
              _buildInfoRow('Currency', _mockWish['currency'] as String),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppTheme.spacing8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  Future<void> _handleViewProduct() async {
    final url = _mockWish['productUrl'] as String?;
    if (url == null) return;

    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Could not open product link')),
          );
        }
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid product link')),
        );
      }
    }
  }

  void _handleClaim() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Claim this wish?'),
        content: Text(
          'You\'re about to claim "${_mockWish['title']}". The owner will be notified that someone has claimed this item (but won\'t see who until you mark it as purchased).',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _performClaim();
            },
            child: const Text('Claim'),
          ),
        ],
      ),
    );
  }

  void _performClaim() {
    // TODO: Implement actual claim logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Claimed "${_mockWish['title']}"'),
        backgroundColor: AppTheme.successColor,
        action: SnackBarAction(
          label: 'View My Claims',
          onPressed: () {
            // TODO: Navigate to claims view
          },
        ),
      ),
    );

    // Update local state
    setState(() {
      _mockWish['status'] = 'claimed';
      _mockWish['canClaim'] = false;
    });
  }

  void _handleShare() {
    // TODO: Implement sharing functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Share functionality coming soon'),
      ),
    );
  }
}

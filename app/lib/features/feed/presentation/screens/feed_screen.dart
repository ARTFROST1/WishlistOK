import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final List<Map<String, dynamic>> _mockCategories = [
    {'id': 1, 'name': 'Birthday', 'icon': Icons.cake, 'color': Colors.pink},
    {'id': 2, 'name': 'Wedding', 'icon': Icons.favorite, 'color': Colors.red},
    {'id': 3, 'name': 'Tech', 'icon': Icons.phone_android, 'color': Colors.blue},
    {'id': 4, 'name': 'Home', 'icon': Icons.home, 'color': Colors.green},
    {'id': 5, 'name': 'Fashion', 'icon': Icons.checkroom, 'color': Colors.purple},
    {'id': 6, 'name': 'Books', 'icon': Icons.book, 'color': Colors.orange},
  ];

  final List<Map<String, dynamic>> _mockCollections = [
    {
      'id': 1,
      'title': 'Best Tech Gifts Under \$100',
      'description': 'Curated tech items perfect for any occasion',
      'itemsCount': 15,
      'isSponsored': false,
      'coverColor': Colors.blue,
    },
    {
      'id': 2,
      'title': 'Wedding Essentials',
      'description': 'Everything couples need for their big day',
      'itemsCount': 28,
      'isSponsored': true,
      'coverColor': Colors.pink,
    },
    {
      'id': 3,
      'title': 'Cozy Home Vibes',
      'description': 'Transform your space into a sanctuary',
      'itemsCount': 22,
      'isSponsored': false,
      'coverColor': Colors.green,
    },
  ];

  final List<Map<String, dynamic>> _mockTrendingItems = [
    {
      'id': 1,
      'title': 'Smart Water Bottle',
      'price': 45.99,
      'category': 'Tech',
      'isSponsored': false,
    },
    {
      'id': 2,
      'title': 'Artisan Coffee Set',
      'price': 78.50,
      'category': 'Home',
      'isSponsored': true,
    },
    {
      'id': 3,
      'title': 'Wireless Earbuds',
      'price': 129.99,
      'category': 'Tech',
      'isSponsored': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gift Ideas'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search
            },
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          // Categories carousel
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(AppTheme.spacing16),
                  child: Text(
                    'Categories',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacing8),
                    itemCount: _mockCategories.length,
                    itemBuilder: (context, index) {
                      final category = _mockCategories[index];
                      return _CategoryCard(category: category);
                    },
                  ),
                ),
              ],
            ),
          ),

          // Featured collections
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppTheme.spacing16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Featured Collections',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: Navigate to all collections
                    },
                    child: const Text('See All'),
                  ),
                ],
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacing16,
                  vertical: AppTheme.spacing4,
                ),
                child: _CollectionCard(collection: _mockCollections[index]),
              ),
              childCount: _mockCollections.length,
            ),
          ),

          // Trending items
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(AppTheme.spacing16),
              child: Text(
                'Trending This Week',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacing8,
                  vertical: AppTheme.spacing4,
                ),
                child: _TrendingItemCard(item: _mockTrendingItems[index]),
              ),
              childCount: _mockTrendingItems.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: AppTheme.spacing8,
              mainAxisSpacing: AppTheme.spacing8,
            ),
          ),

          // Bottom padding
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final Map<String, dynamic> category;

  const _CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: const EdgeInsets.symmetric(horizontal: AppTheme.spacing8),
      child: InkWell(
        onTap: () {
          // TODO: Navigate to category
        },
        borderRadius: BorderRadius.circular(AppTheme.radius12),
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: (category['color'] as Color).withOpacity(0.1),
                borderRadius: BorderRadius.circular(AppTheme.radius12),
              ),
              child: Icon(
                category['icon'] as IconData,
                color: category['color'] as Color,
                size: 28,
              ),
            ),
            const SizedBox(height: AppTheme.spacing8),
            Text(
              category['name'],
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class _CollectionCard extends StatelessWidget {
  final Map<String, dynamic> collection;

  const _CollectionCard({required this.collection});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          // TODO: Navigate to collection
        },
        borderRadius: BorderRadius.circular(AppTheme.radius12),
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacing16),
          child: Row(
            children: [
              // Cover image placeholder
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: (collection['coverColor'] as Color).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppTheme.radius8),
                ),
                child: Icon(
                  Icons.collections,
                  color: collection['coverColor'] as Color,
                  size: 32,
                ),
              ),

              const SizedBox(width: AppTheme.spacing16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            collection['title'],
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (collection['isSponsored']) ...[
                          const SizedBox(width: AppTheme.spacing8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.warningColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'AD',
                              style: TextStyle(
                                color: AppTheme.warningColor,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),

                    const SizedBox(height: AppTheme.spacing4),

                    Text(
                      collection['description'],
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey[600],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),

                    const SizedBox(height: AppTheme.spacing8),

                    Text(
                      '${collection['itemsCount']} items',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

class _TrendingItemCard extends StatelessWidget {
  final Map<String, dynamic> item;

  const _TrendingItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          // TODO: Navigate to item or add to wishlist
        },
        borderRadius: BorderRadius.circular(AppTheme.radius12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image placeholder
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(AppTheme.radius12),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image, size: 32, color: Colors.grey[400]),
                    if (item['isSponsored']) ...[
                      const SizedBox(height: AppTheme.spacing8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.warningColor,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'SPONSORED',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(AppTheme.spacing12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title'],
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: AppTheme.spacing4),

                  Text(
                    item['category'],
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),

                  const SizedBox(height: AppTheme.spacing8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${item['price'].toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.add_circle_outline,
                        size: 20,
                        color: AppTheme.primaryColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';

class AddWishScreen extends StatefulWidget {
  final int? wishlistId;

  const AddWishScreen({super.key, this.wishlistId});

  @override
  State<AddWishScreen> createState() => _AddWishScreenState();
}

class _AddWishScreenState extends State<AddWishScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  final _formKey = GlobalKey<FormState>();
  
  // Controllers for manual entry
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _urlController = TextEditingController();
  
  // Controllers for URL parsing
  final _parseUrlController = TextEditingController();
  
  bool _isLoading = false;
  Map<String, dynamic>? _parsedData;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _urlController.dispose();
    _parseUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Wish'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Paste URL', icon: Icon(Icons.link)),
            Tab(text: 'Manual', icon: Icon(Icons.edit)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: _isLoading ? null : _handleSave,
            child: _isLoading 
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Save'),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildUrlParseTab(),
          _buildManualTab(),
        ],
      ),
    );
  }

  Widget _buildUrlParseTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppTheme.spacing16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Paste Product URL',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          
          const SizedBox(height: AppTheme.spacing8),
          
          Text(
            'Paste a link from any online store and we\'ll automatically fetch the product details.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.grey[600],
            ),
          ),
          
          const SizedBox(height: AppTheme.spacing16),
          
          TextFormField(
            controller: _parseUrlController,
            decoration: InputDecoration(
              labelText: 'Product URL',
              hintText: 'https://example.com/product',
              prefixIcon: const Icon(Icons.link),
              suffixIcon: _parseUrlController.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _parseUrlController.clear();
                        setState(() {
                          _parsedData = null;
                        });
                      },
                    )
                  : null,
            ),
            onChanged: (value) => setState(() {}),
          ),
          
          const SizedBox(height: AppTheme.spacing16),
          
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _parseUrlController.text.isEmpty || _isLoading 
                  ? null 
                  : _handleParseUrl,
              icon: _isLoading 
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.auto_fix_high),
              label: const Text('Parse Product'),
            ),
          ),
          
          if (_parsedData != null) ...[
            const SizedBox(height: AppTheme.spacing24),
            _buildParsePreview(),
          ],
        ],
      ),
    );
  }

  Widget _buildManualTab() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.spacing16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image upload placeholder
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(AppTheme.radius12),
                border: Border.all(color: Colors.grey.shade300, style: BorderStyle.solid),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_photo_alternate, size: 48, color: Colors.grey[400]),
                  const SizedBox(height: AppTheme.spacing8),
                  Text(
                    'Add Photo',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: AppTheme.spacing4),
                  TextButton(
                    onPressed: () {
                      // TODO: Implement image picker
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Image picker coming soon')),
                      );
                    },
                    child: const Text('Choose from gallery'),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: AppTheme.spacing24),
            
            // Title field
            TextFormField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title *',
                hintText: 'What do you wish for?',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
            ),
            
            const SizedBox(height: AppTheme.spacing16),
            
            // Description field
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                labelText: 'Description (Optional)',
                hintText: 'Add details, notes, or why you want this...',
              ),
              maxLines: 3,
            ),
            
            const SizedBox(height: AppTheme.spacing16),
            
            // Price and URL row
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _priceController,
                    decoration: const InputDecoration(
                      labelText: 'Price (Optional)',
                      prefixText: '\$ ',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: AppTheme.spacing12),
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    controller: _urlController,
                    decoration: const InputDecoration(
                      labelText: 'Product URL (Optional)',
                      prefixIcon: Icon(Icons.link),
                    ),
                    keyboardType: TextInputType.url,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: AppTheme.spacing32),
            
            // Save button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _handleSave,
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Add to Wishlist'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildParsePreview() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacing16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.check_circle, color: AppTheme.successColor),
                const SizedBox(width: AppTheme.spacing8),
                Text(
                  'Product Found!',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppTheme.successColor,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: AppTheme.spacing16),
            
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image placeholder
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(AppTheme.radius8),
                  ),
                  child: _parsedData!['imageUrl'] != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(AppTheme.radius8),
                          child: Image.network(
                            _parsedData!['imageUrl'] as String,
                            fit: BoxFit.cover,
                            width: 80,
                            height: 80,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.image, color: Colors.grey),
                          ),
                        )
                      : const Icon(Icons.image, color: Colors.grey),
                ),

                const SizedBox(width: AppTheme.spacing16),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (_parsedData!['title'] as String?) ?? 'No title',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),

                      if (_parsedData!['description'] != null) ...[
                        const SizedBox(height: AppTheme.spacing4),
                        Text(
                          _parsedData!['description'] as String,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey[600],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                      
                      if (_parsedData!['price'] != null) ...[
                        const SizedBox(height: AppTheme.spacing8),
                        Text(
                          '\$${_parsedData!['price'].toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: AppTheme.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: AppTheme.spacing16),
            
            Text(
              'Looks good? You can edit the details or save as-is.',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _handleParseUrl() async {
    if (_parseUrlController.text.trim().isEmpty) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // TODO: Implement actual URL parsing API call
      await Future<void>.delayed(const Duration(seconds: 2)); // Simulate API call
      
      // Mock parsed data
      setState(() {
        _parsedData = {
          'title': 'Wireless Bluetooth Headphones',
          'description': 'High-quality noise-cancelling headphones with premium sound',
          'price': 199.99,
          'imageUrl': null, // Mock - no actual image
          'productUrl': _parseUrlController.text,
        };
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to parse URL: ${e.toString()}'),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _handleSave() async {
    // Validate based on active tab
    if (_tabController.index == 1) {
      if (!_formKey.currentState!.validate()) return;
    } else {
      if (_parsedData == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please parse a URL first or switch to manual entry'),
            backgroundColor: AppTheme.warningColor,
          ),
        );
        return;
      }
    }

    setState(() {
      _isLoading = true;
    });

    try {
      // TODO: Implement actual save logic
      await Future<void>.delayed(const Duration(seconds: 1)); // Simulate API call
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Wish added successfully!'),
            backgroundColor: AppTheme.successColor,
          ),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: AppTheme.errorColor,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }
}

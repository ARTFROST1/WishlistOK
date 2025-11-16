import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';

class CreateWishlistScreen extends StatefulWidget {
  final int? wishlistId; // For editing

  const CreateWishlistScreen({super.key, this.wishlistId});

  @override
  State<CreateWishlistScreen> createState() => _CreateWishlistScreenState();
}

class _CreateWishlistScreenState extends State<CreateWishlistScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  DateTime? _eventDate;
  String _visibility = 'link_only';
  bool _isLoading = false;

  bool get isEditing => widget.wishlistId != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Wishlist' : 'Create Wishlist'),
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
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppTheme.spacing16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title field
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Wishlist Title *',
                  hintText: 'e.g., Birthday 2024, Wedding Registry',
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
                  hintText: 'Add details about your wishlist...',
                ),
                maxLines: 3,
              ),
              
              const SizedBox(height: AppTheme.spacing24),
              
              // Event date
              Text(
                'Event Date (Optional)',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              const SizedBox(height: AppTheme.spacing8),
              
              InkWell(
                onTap: _selectEventDate,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppTheme.spacing16,
                    vertical: AppTheme.spacing12,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(AppTheme.radius8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _eventDate != null
                            ? '${_eventDate!.day}/${_eventDate!.month}/${_eventDate!.year}'
                            : 'Select date',
                        style: TextStyle(
                          color: _eventDate != null ? null : Colors.grey[600],
                        ),
                      ),
                      const Icon(Icons.calendar_today),
                    ],
                  ),
                ),
              ),
              
              const SizedBox(height: AppTheme.spacing24),
              
              // Privacy settings
              Text(
                'Privacy Settings',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              
              const SizedBox(height: AppTheme.spacing8),
              
              Column(
                children: [
                  RadioListTile<String>(
                    title: const Text('Public'),
                    subtitle: const Text('Anyone can find and view this wishlist'),
                    value: 'public',
                    groupValue: _visibility,
                    onChanged: (value) => setState(() => _visibility = value!),
                    contentPadding: EdgeInsets.zero,
                  ),
                  
                  RadioListTile<String>(
                    title: const Text('Link Only'),
                    subtitle: const Text('Only people with the link can view'),
                    value: 'link_only',
                    groupValue: _visibility,
                    onChanged: (value) => setState(() => _visibility = value!),
                    contentPadding: EdgeInsets.zero,
                  ),
                  
                  RadioListTile<String>(
                    title: const Text('Private'),
                    subtitle: const Text('Only you can view this wishlist'),
                    value: 'private',
                    groupValue: _visibility,
                    onChanged: (value) => setState(() => _visibility = value!),
                    contentPadding: EdgeInsets.zero,
                  ),
                ],
              ),
              
              const SizedBox(height: AppTheme.spacing32),
              
              // Save button (for mobile)
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _handleSave,
                  child: _isLoading
                      ? const CircularProgressIndicator()
                      : Text(isEditing ? 'Update Wishlist' : 'Create Wishlist'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectEventDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _eventDate ?? DateTime.now().add(const Duration(days: 30)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
    );
    
    if (date != null) {
      setState(() {
        _eventDate = date;
      });
    }
  }

  Future<void> _handleSave() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      // TODO: Implement actual save logic
      await Future.delayed(const Duration(seconds: 1)); // Simulate API call
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              isEditing ? 'Wishlist updated!' : 'Wishlist created!',
            ),
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

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}

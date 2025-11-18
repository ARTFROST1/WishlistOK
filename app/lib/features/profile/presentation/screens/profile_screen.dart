import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Mock user data - will be replaced with actual user state
  final Map<String, dynamic> _mockUser = {
    'firstName': 'John',
    'lastName': 'Doe',
    'email': 'john.doe@example.com',
    'isGuest': false,
    'joinDate': DateTime(2024, 1, 15),
    'wishlistsCount': 3,
    'claimsCount': 8,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Navigate to settings
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppTheme.spacing24),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withValues(alpha: 0.05),
              ),
              child: Column(
                children: [
                  // Avatar
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: AppTheme.primaryColor.withValues(alpha: 0.2),
                    child: Text(
                      '${(_mockUser['firstName'] as String)[0]}${(_mockUser['lastName'] as String)[0]}',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: AppTheme.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: AppTheme.spacing16),

                  // Name and email
                  Text(
                    '${_mockUser['firstName']} ${_mockUser['lastName']}',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: AppTheme.spacing4),

                  Text(
                    _mockUser['email'] as String,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),

                  const SizedBox(height: AppTheme.spacing16),

                  // Stats row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatItem(
                        context,
                        'Wishlists',
                        _mockUser['wishlistsCount'].toString(),
                        Icons.list_alt,
                      ),
                      Container(width: 1, height: 40, color: Colors.grey[300]),
                      _buildStatItem(
                        context,
                        'Claims',
                        _mockUser['claimsCount'].toString(),
                        Icons.card_giftcard,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppTheme.spacing16),

            // Menu items
            _buildMenuItem(
              context,
              'My Wishlists',
              Icons.list_alt_outlined,
              () => context.go('/'),
            ),

            _buildMenuItem(
              context,
              'My Claims',
              Icons.card_giftcard_outlined,
              () {
                // TODO: Navigate to claims
              },
            ),

            const Divider(height: 32),

            _buildMenuItem(
              context,
              'Account Settings',
              Icons.person_outline,
              _showAccountSettings,
            ),

            _buildMenuItem(
              context,
              'Privacy Settings',
              Icons.lock_outline,
              () {
                // TODO: Navigate to privacy settings
              },
            ),

            _buildMenuItem(
              context,
              'Notifications',
              Icons.notifications_outlined,
              () {
                // TODO: Navigate to notification settings
              },
            ),

            const Divider(height: 32),

            _buildMenuItem(
              context,
              'Help & Support',
              Icons.help_outline,
              () {
                // TODO: Navigate to help
              },
            ),

            _buildMenuItem(
              context,
              'About WishApp',
              Icons.info_outline,
              _showAbout,
            ),

            const Divider(height: 32),

            _buildMenuItem(
              context,
              'Sign Out',
              Icons.logout,
              _showSignOutDialog,
              isDestructive: true,
            ),

            const SizedBox(height: AppTheme.spacing32),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: AppTheme.primaryColor, size: 24),
        const SizedBox(height: AppTheme.spacing8),
        Text(
          value,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
          ),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap, {
    bool isDestructive = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isDestructive ? AppTheme.errorColor : null,
      ),
      title: Text(
        title,
        style: isDestructive
            ? TextStyle(color: AppTheme.errorColor)
            : null,
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  void _showAccountSettings() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        builder: (context, scrollController) => Container(
          padding: const EdgeInsets.all(AppTheme.spacing16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),

              const SizedBox(height: AppTheme.spacing16),

              Text(
                'Account Settings',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: AppTheme.spacing24),

              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: [
                    _buildSettingItem('Edit Profile', Icons.edit, () {}),
                    _buildSettingItem('Change Email', Icons.email, () {}),
                    _buildSettingItem('Change Password', Icons.lock, () {}),
                    _buildSettingItem('Two-Factor Authentication', Icons.security, () {}),
                    const Divider(height: 32),
                    _buildSettingItem('Export Data', Icons.download, () {}),
                    _buildSettingItem('Delete Account', Icons.delete, () {}, isDestructive: true),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem(
    String title,
    IconData icon,
    VoidCallback onTap, {
    bool isDestructive = false,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isDestructive ? AppTheme.errorColor : null,
      ),
      title: Text(
        title,
        style: isDestructive
            ? TextStyle(color: AppTheme.errorColor)
            : null,
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  void _showAbout() {
    showAboutDialog(
      context: context,
      applicationName: 'WishApp',
      applicationVersion: '1.0.0',
      applicationIcon: const Icon(
        Icons.card_giftcard,
        color: AppTheme.primaryColor,
        size: 48,
      ),
      children: [
        const Text(
          'Create, share, and fulfill wishes — all in one place.',
        ),
        const SizedBox(height: 16),
        const Text(
          'Built with Flutter and love ❤️',
        ),
      ],
    );
  }

  void _showSignOutDialog() {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign Out'),
        content: const Text('Are you sure you want to sign out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _handleSignOut();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.errorColor,
            ),
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }

  void _handleSignOut() {
    // TODO: Implement actual sign out logic
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Signed out successfully'),
      ),
    );

    // Navigate to welcome screen
    context.go('/welcome');
  }
}

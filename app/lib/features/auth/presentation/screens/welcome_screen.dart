import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';
import '../../application/auth_provider.dart';
import '../../application/auth_state.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final isLoading = authState is AuthStateLoading;

    // Listen for auth state changes (for guest mode)
    ref.listen<AuthState>(authProvider, (previous, next) {
      next.maybeWhen(
        authenticated: (_) {
          // Navigate to home on successful authentication (guest or regular)
          context.go('/');
        },
        error: (message) {
          // Show error message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: Colors.red,
            ),
          );
          // Clear the error state
          ref.read(authProvider.notifier).clearError();
        },
        orElse: () {},
      );
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppTheme.spacing24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),

              // App Logo/Icon
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppTheme.radius12),
                ),
                child: const Icon(
                  Icons.card_giftcard_rounded,
                  size: 64,
                  color: AppTheme.primaryColor,
                ),
              ),

              const SizedBox(height: AppTheme.spacing32),

              // App Title
              Text(
                'WishApp',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor,
                    ),
              ),

              const SizedBox(height: AppTheme.spacing8),

              // Tagline
              Text(
                'Create, share, and fulfill wishes\n- all in one place',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.grey[600],
                    ),
              ),

              const Spacer(),

              // Action Buttons
              Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : () => context.go('/signup'),
                      child: const Text('Create Wishlist'),
                    ),
                  ),

                  const SizedBox(height: AppTheme.spacing12),

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: OutlinedButton(
                      onPressed: isLoading ? null : () => context.go('/login'),
                      child: const Text('Sign In'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: AppTheme.spacing24),

              // Guest mode option
              isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : TextButton(
                      onPressed: () async {
                        await ref
                            .read(authProvider.notifier)
                            .createGuestUser();
                      },
                      child: Text(
                        'Browse as Guest',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

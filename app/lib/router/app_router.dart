import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/auth/presentation/screens/welcome_screen.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/signup_screen.dart';
import '../features/home/presentation/screens/home_shell.dart';
import '../features/wishlists/presentation/screens/wishlists_screen.dart';
import '../features/wishlists/presentation/screens/wishlist_detail_screen.dart';
import '../features/wishlists/presentation/screens/create_wishlist_screen.dart';
import '../features/wishes/presentation/screens/add_wish_screen.dart';
import '../features/wishes/presentation/screens/wish_detail_screen.dart';
import '../features/feed/presentation/screens/feed_screen.dart';
import '../features/profile/presentation/screens/profile_screen.dart';

// Route names
class RouteNames {
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/';
  static const String wishlists = '/wishlists';
  static const String wishlistDetail = '/wishlists/:id';
  static const String createWishlist = '/wishlists/create';
  static const String editWishlist = '/wishlists/:id/edit';
  static const String addWish = '/wishlists/:id/add-wish';
  static const String wishDetail = '/wishes/:id';
  static const String feed = '/feed';
  static const String profile = '/profile';
  static const String publicWishlist = '/p/:slug';
}

// Router provider
final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RouteNames.welcome,
    debugLogDiagnostics: true,
    routes: [
      // Auth routes
      GoRoute(
        path: RouteNames.welcome,
        name: 'welcome',
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: RouteNames.login,
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RouteNames.signup,
        name: 'signup',
        builder: (context, state) => const SignupScreen(),
      ),
      
      // Public wishlist route (for sharing)
      GoRoute(
        path: RouteNames.publicWishlist,
        name: 'publicWishlist',
        builder: (context, state) {
          final slug = state.pathParameters['slug']!;
          return WishlistDetailScreen(slug: slug, isPublicView: true);
        },
      ),
      
      // Main app shell with bottom navigation
      ShellRoute(
        builder: (context, state, child) => HomeShell(child: child),
        routes: [
          // Lists tab
          GoRoute(
            path: RouteNames.home,
            name: 'home',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: WishlistsScreen(),
            ),
            routes: [
              GoRoute(
                path: 'create',
                name: 'createWishlist',
                builder: (context, state) => const CreateWishlistScreen(),
              ),
              GoRoute(
                path: 'wishlists/:id',
                name: 'wishlistDetail',
                builder: (context, state) {
                  final id = int.parse(state.pathParameters['id']!);
                  return WishlistDetailScreen(wishlistId: id);
                },
                routes: [
                  GoRoute(
                    path: 'edit',
                    name: 'editWishlist',
                    builder: (context, state) {
                      final id = int.parse(state.pathParameters['id']!);
                      return CreateWishlistScreen(wishlistId: id);
                    },
                  ),
                  GoRoute(
                    path: 'add-wish',
                    name: 'addWish',
                    builder: (context, state) {
                      final id = int.parse(state.pathParameters['id']!);
                      return AddWishScreen(wishlistId: id);
                    },
                  ),
                ],
              ),
              GoRoute(
                path: 'wishes/:id',
                name: 'wishDetail',
                builder: (context, state) {
                  final id = int.parse(state.pathParameters['id']!);
                  return WishDetailScreen(wishId: id);
                },
              ),
            ],
          ),
          
          // Feed tab
          GoRoute(
            path: '/feed',
            name: 'feed',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: FeedScreen(),
            ),
          ),
          
          // Add wish tab (quick access)
          GoRoute(
            path: '/add',
            name: 'add',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: AddWishScreen(),
            ),
          ),
          
          // Profile tab
          GoRoute(
            path: '/profile',
            name: 'profile',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ProfileScreen(),
            ),
          ),
        ],
      ),
    ],
    
    // Redirect logic
    redirect: (context, state) {
      // TODO: Check auth state and redirect accordingly
      // For now, allow all routes
      return null;
    },
    
    // Error handling
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              'Page not found: ${state.uri.path}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go(RouteNames.home),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
  );
});

// Extension for easy navigation
extension GoRouterExtensions on GoRouter {
  void goToWishlistDetail(int id) => go('/wishlists/$id');
  void goToWishDetail(int id) => go('/wishes/$id');
  void goToAddWish(int wishlistId) => go('/wishlists/$wishlistId/add-wish');
  void goToEditWishlist(int id) => go('/wishlists/$id/edit');
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../core/network/api_client.dart';
import '../../../core/models/user.dart';
import '../../../core/config/app_config.dart';
import '../data/repositories/auth_repository.dart';
import 'auth_state.dart';

// Auth notifier
class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository _authRepository;
  final FlutterSecureStorage _storage;
  final ApiClient _apiClient;

  AuthNotifier(this._authRepository, this._storage, this._apiClient) 
      : super(const AuthState.initial()) {
    _checkAuthState();
  }

  Future<void> _checkAuthState() async {
    state = const AuthState.loading();
    
    try {
      final token = await _storage.read(key: AppConfig.jwtTokenKey);
      if (token != null) {
        final user = await _authRepository.getCurrentUser();
        state = AuthState.authenticated(user);
      } else {
        state = const AuthState.unauthenticated();
      }
    } catch (e) {
      await _clearTokens();
      state = const AuthState.unauthenticated();
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    state = const AuthState.loading();
    
    try {
      final response = await _authRepository.signIn(
        email: email,
        password: password,
      );
      
      await _apiClient.setAuthToken(response.token);
      state = AuthState.authenticated(response.user);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> signUp({
    required String email,
    required String password,
    required String firstName,
    String? lastName,
  }) async {
    state = const AuthState.loading();
    
    try {
      final response = await _authRepository.signUp(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
      );
      
      await _apiClient.setAuthToken(response.token);
      state = AuthState.authenticated(response.user);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await _authRepository.signOut();
    } catch (e) {
      // Continue with logout even if API call fails
    } finally {
      await _clearTokens();
      state = const AuthState.unauthenticated();
    }
  }

  Future<void> createGuestUser() async {
    state = const AuthState.loading();
    
    try {
      final response = await _authRepository.createGuestUser();
      await _apiClient.setGuestToken(response.token);
      state = AuthState.authenticated(response.user);
    } catch (e) {
      state = AuthState.error(e.toString());
    }
  }

  Future<void> _clearTokens() async {
    await _apiClient.clearTokens();
  }

  void clearError() {
    state.maybeWhen(
      error: (_) => state = const AuthState.unauthenticated(),
      orElse: () {},
    );
  }
}

// Providers
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  const storage = FlutterSecureStorage();
  final apiClient = ApiClient();
  
  return AuthNotifier(authRepository, storage, apiClient);
});

// Helper providers
final currentUserProvider = Provider<User?>((ref) {
  final authState = ref.watch(authProvider);
  return authState.maybeWhen(
    authenticated: (user) => user,
    orElse: () => null,
  );
});

final isAuthenticatedProvider = Provider<bool>((ref) {
  final authState = ref.watch(authProvider);
  return authState.maybeWhen(
    authenticated: (_) => true,
    orElse: () => false,
  );
});

final isGuestProvider = Provider<bool>((ref) {
  final user = ref.watch(currentUserProvider);
  return user?.isGuest ?? false;
});

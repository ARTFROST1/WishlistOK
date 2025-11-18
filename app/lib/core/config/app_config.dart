import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

class AppConfig {
  static const String appName = 'WishApp';
  static const String version = '1.0.0';

  // API Configuration - Platform-aware URL detection
  static String get apiBaseUrl => '${_getBaseHost()}/api/v1';
  static String get publicBaseUrl => _getBaseHost();

  /// Returns the correct base URL for the current platform
  /// - Android emulator: 10.0.2.2 (maps to host machine's localhost)
  /// - iOS simulator: localhost (directly accessible)
  /// - Web: localhost
  static String _getBaseHost() {
    if (kIsWeb) {
      return 'http://localhost:3000';
    }

    try {
      if (Platform.isAndroid) {
        // Android emulator uses 10.0.2.2 to reach host machine
        return 'http://10.0.2.2:3000';
      } else if (Platform.isIOS) {
        // iOS simulator can access localhost directly
        return 'http://localhost:3000';
      }
    } catch (e) {
      // Platform not available, fallback to localhost
    }

    return 'http://localhost:3000';
  }
  
  // Storage Keys
  static const String jwtTokenKey = 'jwt_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String guestTokenKey = 'guest_token';
  static const String userDataKey = 'user_data';
  static const String themeKey = 'theme_mode';
  
  // Timeouts
  static const Duration apiTimeout = Duration(seconds: 30);
  static const Duration connectTimeout = Duration(seconds: 10);
  
  // Pagination
  static const int defaultPageSize = 20;
  
  // UI Constants
  static const double defaultPadding = 16.0;
  static const double cardRadius = 12.0;
  static const double buttonRadius = 8.0;
  
  // Feature Flags
  static const bool enableLogs = true; // Enable in debug mode
  static const bool enableGuestMode = true;
  static const bool enableWebView = true;
}

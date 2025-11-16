class AppConfig {
  static const String appName = 'WishApp';
  static const String version = '1.0.0';
  
  // API Configuration
  static const String apiBaseUrl = 'http://localhost:3000/api/v1';
  static const String publicBaseUrl = 'http://localhost:3000';
  
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

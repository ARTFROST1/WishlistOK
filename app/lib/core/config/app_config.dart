import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static late final String apiBaseUrl;
  static late final int apiTimeout;
  static late final bool enableDebugLogging;
  static late final bool enableGuestMode;
  static late final String appName;
  static late final String appVersion;

  static Future<void> initialize() async {
    apiBaseUrl = dotenv.env['API_BASE_URL'] ?? 'http://localhost:3001';
    apiTimeout = int.tryParse(dotenv.env['API_TIMEOUT'] ?? '30000') ?? 30000;
    enableDebugLogging = dotenv.env['ENABLE_DEBUG_LOGGING']?.toLowerCase() == 'true';
    enableGuestMode = dotenv.env['ENABLE_GUEST_MODE']?.toLowerCase() == 'true';
    appName = dotenv.env['APP_NAME'] ?? 'WishApp';
    appVersion = dotenv.env['APP_VERSION'] ?? '1.0.0';
  }
}

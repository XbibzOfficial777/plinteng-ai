import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Bootstraps the application outside of the widget tree.
///
/// Responsibilities:
/// - Initialize secure storage used for AI provider credentials.
/// - Register any global singletons (HTTP client, database, Rive assets).
/// - Seed default configuration when the app runs for the first time.
///
/// This function is intentionally small and testable.
Future<void> bootstrap() async {
  // Secure storage for API keys and provider credentials.
  // Keys are never written to logs, analytics, or crash reports.
  await FlutterSecureStorage.setInitialOptions(
    options: const StorageOptions(
      iosKeychainPreface: 'com.plinteng.ai.',
      androidSharedPreferencesName: 'plinteng_secure_prefs',
    ),
  );
}

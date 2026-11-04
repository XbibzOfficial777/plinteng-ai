import 'core/storage/secure_storage.dart';

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
  // Platform options (AndroidOptions / IOSOptions) are configured per
  // instance in SecureStorage. Keys are never written to logs, analytics,
  // or crash reports.
  await SecureStorage.instance.readActiveAgentId();
}

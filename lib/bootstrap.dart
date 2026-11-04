import 'app/providers/app_state_provider.dart';
import 'core/database/db.dart';
import 'core/database/seed_service.dart';
import 'core/storage/secure_storage.dart';

/// Bootstraps the application outside of the widget tree.
///
/// Responsibilities:
/// - Open the drift database and seed defaults on first run.
/// - Initialize secure storage used for AI provider credentials.
///
/// This function is intentionally small and testable.
Future<void> bootstrap() async {
  // Open the local SQLite database and seed defaults (idempotent).
  await SeedService(database).seed();

  // Secure storage for API keys and provider credentials.
  // Keys are never written to logs, analytics, or crash reports.
  final savedAgent = await SecureStorage.instance.readActiveAgentId();
  if (savedAgent != null && savedAgent.isNotEmpty) {
    setSavedActiveAgentId(savedAgent);
  }
}

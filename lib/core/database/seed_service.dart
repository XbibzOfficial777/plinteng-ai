import '../../../shared/models/agent.dart';

import 'app_database.dart';

/// Seeds default data on first run.
///
/// Idempotent: if agents already exist, seeding is skipped.
class SeedService {
  SeedService(this._db);

  final AppDatabase _db;

  Future<void> seed() async {
    final existing = await _db.allAgents().get();
    if (existing.isNotEmpty) return;

    await _db.into(_db.agents).insert(AgentCompanion.insert(
      id: 'agent-1',
      name: 'Linca',
      personality: 'Asisten AI yang ramah, membantu, dan proaktif.',
      customInstructions: '',
      preferredLanguage: 'id',
      responseLength: 'medium',
      formality: 'casual',
      humorEnabled: true,
      providerId: 'openai',
      integrationIds: '',
      isActive: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    ));
  }
}

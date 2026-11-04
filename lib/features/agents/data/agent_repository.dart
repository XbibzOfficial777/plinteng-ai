import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/db.dart';
import '../../../shared/models/agent.dart';

/// Persistence + query layer for agents.
///
/// Every agent owns isolated data. Cross-agent reads are intentionally
/// absent — callers must pass the agent id explicitly.
class AgentRepository {
  AgentRepository(this._db);

  final AppDatabase _db;

  /// Reactive list of all agents (newest first).
  Stream<List<Agent>> watchAll() {
    final stmt = _db.allAgents();
    stmt.orderBy([(t) =>
        OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)]);
    return stmt
        .watch()
        .map((rows) => rows.map((r) => r.toAgent()).toList());
  }

  Future<List<Agent>> getAll() async {
    final rows = await _db.allAgents().get();
    return rows.map((r) => r.toAgent()).toList();
  }

  Stream<Agent?> watch(String id) {
    final stmt = _db.allAgents();
    stmt.where((t) => t.id.equals(id));
    return stmt
        .watch()
        .map((rows) => rows.firstOrNull?.toAgent());
  }

  Future<Agent?> get(String id) async {
    final stmt = _db.allAgents();
    stmt.where((t) => t.id.equals(id));
    final rows = await stmt.get();
    return rows.firstOrNull?.toAgent();
  }

  Future<void> insert(Agent agent) async {
    await _db.into(_db.agents).insert(AgentsCompanion.insert(
      id: agent.id,
      name: agent.name,
      personality: agent.personality,
      customInstructions: agent.customInstructions,
      preferredLanguage: agent.preferredLanguage,
      responseLength: agent.responseLength,
      formality: agent.formality,
      humorEnabled: agent.humorEnabled,
      providerId: agent.providerId,
      integrationIds: agent.integrationIds,
      isActive: agent.isActive,
      createdAt: agent.createdAt,
      updatedAt: DateTime.now(),
    ));
  }

  Future<void> update(Agent agent) async {
    await _db.update(_db.agents).replace(AgentsRow(
      id: agent.id,
      name: agent.name,
      personality: agent.personality,
      customInstructions: agent.customInstructions,
      preferredLanguage: agent.preferredLanguage,
      responseLength: agent.responseLength,
      formality: agent.formality,
      humorEnabled: agent.humorEnabled,
      providerId: agent.providerId,
      integrationIds: agent.integrationIds,
      isActive: agent.isActive,
      createdAt: agent.createdAt,
      updatedAt: DateTime.now(),
    ));
  }

  Future<void> delete(String id) async {
    final stmt = _db.delete(_db.agents);
    stmt.where((t) => t.id.equals(id));
    await stmt.go();
  }

  Future<void> setActive(String id, bool isActive) async {
    final stmt = _db.update(_db.agents);
    stmt.where((t) => t.id.equals(id));
    await stmt.write(AgentsCompanion(isActive: Value(isActive)));
  }
}

final agentRepositoryProvider =
    FutureProvider<AgentRepository>((ref) async {
  final db = await ref.watch(databaseProvider);
  return AgentRepository(db);
});

/// Reactive list of all agents.
final agentsProvider = StreamProvider<List<Agent>>(
  (ref) => ref.watch(agentRepositoryProvider).when(
        data: (repo) => repo.watchAll(),
        loading: () => const Stream.empty(),
        error: (_, __) => const Stream.empty(),
      ),
);

/// Reactive single agent.
final agentProvider = StreamProvider.family<Agent?, String>(
  (ref, String id) => ref.watch(agentRepositoryProvider).when(
        data: (repo) => repo.watch(id),
        loading: () => const Stream.empty(),
        error: (_, __) => const Stream.empty(),
      ),
);

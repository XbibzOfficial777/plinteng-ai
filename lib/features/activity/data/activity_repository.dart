import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/db.dart';
import '../../../shared/models/activity.dart';

/// Append-only activity history.
///
/// Every meaningful user/agent action is recorded here (conversations,
/// provider events, automation runs) so the Activity tab shows real
/// history — never fabricated entries.
class ActivityRepository {
  ActivityRepository(this._db);

  final AppDatabase _db;

  Stream<List<ActivityItem>> watchAll() {
    return watchAllLimited(100);
  }

  Stream<List<ActivityItem>> watchAllLimited(int limit) {
    final stmt = _db.allActivity();
    stmt.orderBy([(t) =>
        OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)]);
    return stmt
        .watch()
        .map((rows) =>
            rows.map((r) => r.toActivity()).take(limit).toList());
  }

  Future<List<ActivityItem>> getAll() async {
    return getAllLimited(100);
  }

  Future<List<ActivityItem>> getAllLimited(int limit) async {
    final rows = await _db.allActivity().get();
    final items = rows.map((r) => r.toActivity()).toList();
    items.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    return items.take(limit).toList();
  }

  Future<void> log(
    ActivityKind kind,
    String title, {
    String details = '',
    ActivityStatus status = ActivityStatus.completed,
  }) async {
    await _db.into(_db.activityItems).insert(ActivityItemsCompanion.insert(
      id: 'act-${DateTime.now().millisecondsSinceEpoch}-${kind.name}',
      kind: kind.name,
      title: title,
      details: details,
      status: status.name,
      createdAt: DateTime.now(),
    ));
  }

  Future<void> clear() async {
    await _db.delete(_db.activityItems).go();
  }
}

final databaseProvider = FutureProvider<AppDatabase>((ref) => database);

final activityRepositoryProvider =
    FutureProvider<ActivityRepository>((ref) async {
  final db = await ref.watch(databaseProvider);
  return ActivityRepository(db);
});

/// Reactive activity feed (newest first, capped).
final activityProvider = StreamProvider<List<ActivityItem>>(
  (ref) => ref.watch(activityRepositoryProvider).when(
        data: (repo) => repo.watchAll(),
        loading: () => const Stream.empty(),
        error: (_, __) => const Stream.empty(),
      ),
);

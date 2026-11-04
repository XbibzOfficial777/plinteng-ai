import 'package:drift/drift.dart';

part 'app_database.g.dart';

class Agents extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get personality => text()();
  TextColumn get customInstructions => text()();
  TextColumn get preferredLanguage => text()();
  TextColumn get responseLength => text()();
  TextColumn get formality => text()();
  BoolColumn get humorEnabled => boolean()();
  TextColumn get providerId => text()();
  TextColumn get integrationIds => text()();
  BoolColumn get isActive => boolean()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class ActivityItems extends Table {
  TextColumn get id => text()();
  TextColumn get kind => text()();
  TextColumn get title => text()();
  TextColumn get details => text()();
  TextColumn get status => text()();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Agents, ActivityItems])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (Migrator m) => m.createAll(),
  );
}

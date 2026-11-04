import 'package:drift/drift.dart';

part 'app_database.drift.dart';

@Table()
class Agents extends Table {
  TextColumn get id => text();
  TextColumn get name => text();
  TextColumn get personality => text();
  TextColumn get customInstructions => text();
  TextColumn get preferredLanguage => text();
  TextColumn get responseLength => text();
  TextColumn get formality => text();
  BooleanColumn get humorEnabled => boolean();
  TextColumn get providerId => text();
  TextColumn get integrationIds => text();
  BooleanColumn get isActive => boolean();
  DateTimeColumn get createdAt => dateTime();
  DateTimeColumn get updatedAt => dateTime();

  @override
  Set<Column> get primaryKeys => {id};
}

@Table()
class ActivityItems extends Table {
  TextColumn get id => text();
  TextColumn get kind => text();
  TextColumn get title => text();
  TextColumn get details => text();
  TextColumn get status => text();
  DateTimeColumn get createdAt => dateTime();

  @override
  Set<Column> get primaryKeys => {id};
}

@DriftDatabase()
class AppDatabase extends _$AppDatabase with MigrationUtils {
  AppDatabase(Connection connection) : super(connection);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (CreateSchema m) => m.createAll(),
  );

  SelectStatement<ResultSet<AgentsRow>> allAgents() => select(agents);
  SelectStatement<ResultSet<ActivityItemsRow>> allActivity() =>
      select(activityItems);
}

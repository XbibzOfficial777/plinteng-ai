import 'package:drift/drift.dart';

part 'app_database.drift.dart';

@Table()
class Agents extends Table {
  TextColumn get id => text().coerceToNotNull();
  TextColumn get name => text().coerceToNotNull();
  TextColumn get personality => text().coerceToNotNull();
  TextColumn get customInstructions =>
      text().map((o) => o ?? '').coerceToNotNull();
  TextColumn get preferredLanguage =>
      text().map((o) => o ?? '').coerceToNotNull();
  TextColumn get responseLength =>
      text().map((o) => o ?? 'medium').coerceToNotNull();
  TextColumn get formality =>
      text().map((o) => o ?? 'medium').coerceToNotNull();
  BooleanColumn get humorEnabled => boolean().withDefaultValue(false);
  TextColumn get providerId => text().map((o) => o ?? '').coerceToNotNull();
  TextColumn get integrationIds =>
      text().map((o) => o ?? '').coerceToNotNull();
  BooleanColumn get isActive => boolean().withDefaultValue(false);
  DateTimeColumn get createdAt =>
      dateTime().withDefaultValue(const DefaultValueCurrentDate());
  DateTimeColumn get updatedAt =>
      dateTime().withDefaultValue(const DefaultValueCurrentDate());

  @override
  Set<Column> get primaryKeys => {id};
}

@Table()
class ActivityItems extends Table {
  TextColumn get id => text().coerceToNotNull();
  TextColumn get kind => text().coerceToNotNull();
  TextColumn get title => text().coerceToNotNull();
  TextColumn get details => text().map((o) => o ?? '').coerceToNotNull();
  TextColumn get status =>
      text().map((o) => o ?? 'completed').coerceToNotNull();
  DateTimeColumn get createdAt =>
      dateTime().withDefaultValue(const DefaultValueCurrentDate());

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

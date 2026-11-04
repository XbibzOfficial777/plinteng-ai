import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'app_database.dart';

/// Global database instance.
///
/// Opens a local SQLite database via drift_flutter's NativeDatabase.
/// Connection is lazy — the database file is opened on first query.
final database = AppDatabase.connect(
  NativeDatabase('app_database.db'),
);

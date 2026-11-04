import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';

import 'app_database.dart';

/// Global database instance.
///
/// Opens a local SQLite database via drift's NativeDatabase.
/// Connection is lazy — the database file is opened on first query.
final database = AppDatabase(
  NativeDatabase.createInBackground(File('app_database.db')),
);

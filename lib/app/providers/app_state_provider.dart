import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/storage/secure_storage.dart';

/// Last-known active agent id loaded during bootstrap (synchronous read).
String? _savedActiveAgentId;
void setSavedActiveAgentId(String? id) => _savedActiveAgentId = id;

/// Application-wide state (theme mode + active agent).
final themeModeProvider =
    NotifierProvider<ThemeModeNotifier, ThemeMode>(ThemeModeNotifier.new);

class ThemeModeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() => ThemeMode.system;

  void toggle() => state = state == ThemeMode.dark
      ? ThemeMode.light
      : ThemeMode.dark;
}

/// The active agent id, persisted in secure storage.
final activeAgentIdProvider = NotifierProvider<ActiveAgentNotifier, String>(
  ActiveAgentNotifier.new,
);

class ActiveAgentNotifier extends Notifier<String> {
  @override
  String build() => _savedActiveAgentId ?? 'agent-1';

  Future<void> save(String id) async {
    await SecureStorage.instance.saveActiveAgentId(id);
    state = id;
  }
}

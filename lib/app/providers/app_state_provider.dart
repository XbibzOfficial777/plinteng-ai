import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

final activeAgentIdProvider = Provider<String>((ref) => 'agent-1');

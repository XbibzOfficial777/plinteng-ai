import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Application-wide state (theme mode + active agent).
final themeModeProvider =
    StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  return ThemeModeNotifier();
});

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  ThemeModeNotifier() : super(ThemeMode.system);

  void toggle() => state = state == ThemeMode.dark
      ? ThemeMode.light
      : ThemeMode.dark;
}

final activeAgentIdProvider = StateProvider<String>((ref) => 'agent-1');

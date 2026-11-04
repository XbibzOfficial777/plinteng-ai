import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';

/// Application-level configuration.
///
/// Keep environment-specific values here. Never hardcode secrets —
/// API keys live in secure storage only.
@immutable
abstract final class AppConfig {
  const AppConfig._();

  static const String appName = 'Plinteng AI';
  static const String packageId = 'com.plinteng.ai';
  static const String version = '0.1.0';

  // ---- Network policy ----
  // Only these hosts are ever contacted (aligned with the product
  // privacy model). Any other host is refused before data is sent.
  static const List<String> allowedHosts = <String>[
    'api.openai.com',
    'api.anthropic.com',
    'generativelanguage.googleapis.com',
    'api.telegram.org',
  ];

  static const bool allowCleartext = false;

  // ---- Storage ----
  static const String secureStorageIosPrefix = 'com.plinteng.ai.';
  static const String secureStorageAndroidPrefs = 'plinteng_secure_prefs';

  // ---- Localization ----
  static const ui.Locale defaultLocale = ui.Locale('id');
  static const ui.Locale fallbackLocale = ui.Locale('en');

  // ---- Mascot ----
  static const String mascotRiveAsset = 'assets/rive/mascot.riv';
  static const String mascotStateMachine = 'mascot';
}

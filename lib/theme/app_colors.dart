import 'package:flutter/material.dart';

/// Semantic color tokens for Plinteng AI.
///
/// The palette is an original "warm editorial minimalism" system:
/// warm off-white surfaces, refined coral/orange accents, warm charcoal
/// text. Dark theme is deliberately designed (not an inversion of light).
///
/// Reference studied: NgtmyAgent v1.3.0 (warm off-white #F5F1EC, coral
/// #F5B07B accents, warm charcoal text). Plinteng evolves this into a
/// fully tokenized system with dark mode.
abstract final class AppColors {
  // ---- Light theme ----
  static const Color background = Color(0xFFF5F1EC);
  static const Color surface = Color(0xFFFFFDF9);
  static const Color elevatedSurface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFECE4DB);

  static const Color primary = Color(0xFFDF7646);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color secondary = Color(0xFFF0A060);
  static const Color onSecondary = Color(0xFF3A2317);
  static const Color primaryContainer = Color(0xFFFBE3D6);
  static const Color onPrimaryContainer = Color(0xFF5A2A12);

  static const Color onBackground = Color(0xFF342F2E);
  static const Color onSurface = Color(0xFF342F2E);
  static const Color onSurfaceVariant = Color(0xFF6E645A);

  static const Color outline = Color(0xFFD9CFC2);
  static const Color outlineVariant = Color(0xFFE5DDD2);

  static const Color success = Color(0xFF3F7D5D);
  static const Color onSuccess = Color(0xFFFFFFFF);
  static const Color warning = Color(0xFFC98A2B);
  static const Color onWarning = Color(0xFFFFFFFF);
  static const Color error = Color(0xFFC9544A);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color disabled = Color(0xFFB8B0A6);
  static const Color scrim = Color(0x66000000);

  // ---- Dark theme ----
  static const Color darkBackground = Color(0xFF171512);
  static const Color darkSurface = Color(0xFF211D19);
  static const Color darkElevatedSurface = Color(0xFF2A2520);
  static const Color darkSurfaceVariant = Color(0xFF2E2924);

  static const Color darkPrimary = Color(0xFFFFB483);
  static const Color darkOnPrimary = Color(0xFF3A2317);
  static const Color darkSecondary = Color(0xFFFF8A5C);
  static const Color darkOnSecondary = Color(0xFF2A1608);
  static const Color darkPrimaryContainer = Color(0xFF3A2A1F);
  static const Color darkOnPrimaryContainer = Color(0xFFFFB483);

  static const Color darkOnBackground = Color(0xFFF5F1EC);
  static const Color darkOnSurface = Color(0xFFF5F1EC);
  static const Color darkOnSurfaceVariant = Color(0xFFA99E91);

  static const Color darkOutline = Color(0xFF4A4239);
  static const Color darkOutlineVariant = Color(0xFF3A342F);

  static const Color darkSuccess = Color(0xFF6FB08A);
  static const Color darkOnSuccess = Color(0xFF10291C);
  static const Color darkWarning = Color(0xFFE0A548);
  static const Color darkOnWarning = Color(0xFF2A1A05);
  static const Color darkError = Color(0xFFE07A6E);
  static const Color darkOnError = Color(0xFF2A120F);
  static const Color darkDisabled = Color(0xFF6E645A);
  static const Color darkScrim = Color(0x99000000);

  /// Token list for light theme (background → disabled).
  static const List<({String name, Color color})> lightTokens = [
    (name: 'background', color: background),
    (name: 'surface', color: surface),
    (name: 'elevatedSurface', color: elevatedSurface),
    (name: 'primary', color: primary),
    (name: 'secondary', color: secondary),
    (name: 'onBackground', color: onBackground),
    (name: 'onSurface', color: onSurface),
    (name: 'onSurfaceVariant', color: onSurfaceVariant),
    (name: 'outline', color: outline),
    (name: 'outlineVariant', color: outlineVariant),
    (name: 'success', color: success),
    (name: 'warning', color: warning),
    (name: 'error', color: error),
    (name: 'disabled', color: disabled),
  ];

  /// Token list for dark theme (background → disabled).
  static const List<({String name, Color color})> darkTokens = [
    (name: 'background', color: darkBackground),
    (name: 'surface', color: darkSurface),
    (name: 'elevatedSurface', color: darkElevatedSurface),
    (name: 'primary', color: darkPrimary),
    (name: 'secondary', color: darkSecondary),
    (name: 'onBackground', color: darkOnBackground),
    (name: 'onSurface', color: darkOnSurface),
    (name: 'onSurfaceVariant', color: darkOnSurfaceVariant),
    (name: 'outline', color: darkOutline),
    (name: 'outlineVariant', color: darkOutlineVariant),
    (name: 'success', color: darkSuccess),
    (name: 'warning', color: darkWarning),
    (name: 'error', color: darkError),
    (name: 'disabled', color: darkDisabled),
  ];
}

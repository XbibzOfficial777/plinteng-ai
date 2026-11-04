import 'package:flutter/material.dart';

/// Typography scale for Plinteng AI.
///
/// Based on the Outfit typeface (open-source, OFL) for a modern, highly
/// legible editorial feel; falls back to Roboto if the bundled face is
/// unavailable. Sizes follow a 1.125–1.333 modular scale.
abstract final class AppTypography {
  const AppTypography._();

  static const String fontFamily = 'Outfit';

  static const TextStyle displayLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 34,
    height: 1.18,
    weight: FontWeight.w600,
    color: AppColors.onSurface,
  );

  static const TextStyle displayMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    height: 1.25,
    weight: FontWeight.w600,
    color: AppColors.onSurface,
  );

  static const TextStyle headlineLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24,
    height: 1.33,
    weight: FontWeight.w600,
    color: AppColors.onSurface,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 20,
    height: 1.33,
    weight: FontWeight.w600,
    color: AppColors.onSurface,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18,
    height: 1.33,
    weight: FontWeight.w600,
    color: AppColors.onSurface,
  );

  static const TextStyle titleLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    height: 1.4,
    weight: FontWeight.w600,
    color: AppColors.onSurface,
  );

  static const TextStyle titleMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 1.4,
    weight: FontWeight.w600,
    color: AppColors.onSurface,
  );

  static const TextStyle titleSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    height: 1.4,
    weight: FontWeight.w600,
    color: AppColors.onSurfaceVariant,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    height: 1.55,
    weight: FontWeight.w400,
    color: AppColors.onSurface,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 1.55,
    weight: FontWeight.w400,
    color: AppColors.onSurface,
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    height: 1.5,
    weight: FontWeight.w400,
    color: AppColors.onSurfaceVariant,
  );

  static const TextStyle labelLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14,
    height: 1.4,
    weight: FontWeight.w500,
    color: AppColors.onSurface,
  );

  static const TextStyle labelMedium = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    height: 1.4,
    weight: FontWeight.w500,
    color: AppColors.onSurfaceVariant,
  );

  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    height: 1.4,
    weight: FontWeight.w500,
    color: AppColors.onSurfaceVariant,
  );

  /// Display styles for the brand mascot and hero sections.
  static const TextStyle brandDisplay = TextStyle(
    fontFamily: fontFamily,
    fontSize: 30,
    height: 1.2,
    weight: FontWeight.w700,
    color: AppColors.onSurface,
  );
}

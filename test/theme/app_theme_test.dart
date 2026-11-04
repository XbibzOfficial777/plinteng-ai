import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plinteng_ai/theme/app_colors.dart';
import 'package:plinteng_ai/theme/app_theme.dart';

void main() {
  test('light theme is Material 3 with token colors', () {
    final theme = AppTheme.light;
    expect(theme.useMaterial3, isTrue);
    expect(theme.colorScheme.primary, AppColors.primary);
    expect(theme.scaffoldBackgroundColor, AppColors.background);
  });

  test('dark theme is deliberately different from light', () {
    final light = AppTheme.light;
    final dark = AppTheme.dark;
    expect(dark.scaffoldBackgroundColor, isNot(light.scaffoldBackgroundColor));
    expect(dark.colorScheme.primary, isNot(light.colorScheme.primary));
  });
}

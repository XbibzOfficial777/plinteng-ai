import 'package:flutter_test/flutter_test.dart';
import 'package:plinteng_ai/theme/app_colors.dart';

void main() {
  test('light and dark backgrounds are distinct', () {
    expect(AppColors.background, isNot(AppColors.darkBackground));
    expect(AppColors.surface, isNot(AppColors.darkSurface));
  });

  test('primary color is coral/orange family', () {
    final c = AppColors.primary;
    expect(c.r, greaterThan(180));
    expect(c.g, greaterThan(80));
    expect(c.b, lessThan(140));
  });

  test('semantic tokens cover required categories', () {
    final names = AppColors.lightTokens.map((t) => t.name).toSet();
    expect(names, containsAll(<String>[
      'background',
      'surface',
      'elevatedSurface',
      'primary',
      'secondary',
      'onBackground',
      'onSurface',
      'onSurfaceVariant',
      'outline',
      'outlineVariant',
      'success',
      'warning',
      'error',
      'disabled',
    ]));
  });
}

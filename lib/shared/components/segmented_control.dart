import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';

/// A segmented control for selecting between 2–4 options.
/// Used for agent switching on the home screen.
class SegmentedControl<T> extends StatelessWidget {
  const SegmentedControl({
    super.key,
    required this.options,
    required this.selected,
    required this.onSelected,
  });

  final List<({String label, T value, IconData? icon})> options;
  final T selected;
  final ValueChanged<T> onSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: options.map((opt) {
          final isSelected = opt.value == selected;
          return Expanded(
            child: GestureDetector(
              onTap: () => onSelected(opt.value),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 150),
                padding: const EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.elevatedSurface : Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: isSelected
                      ? const [
                          BoxShadow(
                            color: Color(0x14000000),
                            blurRadius: 6,
                            offset: Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (opt.icon != null)
                      Icon(opt.icon, size: 16, color: isSelected ? AppColors.primary : theme.colorScheme.onSurfaceVariant),
                    if (opt.icon != null) const SizedBox(width: 6),
                    Text(
                      opt.label,
                      style: AppTypography.labelMedium.copyWith(
                        color: isSelected ? AppColors.onSurface : theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

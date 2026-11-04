import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';

/// Semantic button variants on token colors.
enum AppButtonKind { primary, secondary, outline, ghost }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.kind = AppButtonKind.primary,
    this.icon,
    this.onPressed,
    this.expanded = false,
  });

  final String label;
  final AppButtonKind kind;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isPrimary = kind == AppButtonKind.primary;
    final isOutline = kind == AppButtonKind.outline;
    final isGhost = kind == AppButtonKind.ghost;

    return SizedBox(
      width: expanded ? double.infinity : null,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? AppColors.primary : AppColors.elevatedSurface,
          foregroundColor: isPrimary ? AppColors.onPrimary : AppColors.onSurface,
          side: isOutline ? BorderSide(color: AppColors.outline) : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          minimumSize: const Size.fromHeight(52),
          visualDensity: VisualDensity.standard,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) Icon(icon, size: 20, color: isPrimary ? AppColors.onPrimary : AppColors.onSurface),
            if (icon != null) const SizedBox(width: 8),
            Text(label, style: AppTypography.labelLarge),
          ],
        ),
      ),
    );
  }
}

/// Compact icon-only button used in toolbars.
class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    this.tooltip,
    this.onPressed,
  });

  final IconData icon;
  final String? tooltip;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, size: 24),
      tooltip: tooltip,
      onPressed: onPressed,
      visualDensity: VisualDensity.compact,
    );
  }
}

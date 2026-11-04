import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

/// A reusable content card with rounded corners and a consistent padding.
class SectionCard extends StatelessWidget {
  const SectionCard({
    super.key,
    required this.title,
    this.titleStyle,
    this.child,
    this.actions,
    this.padding = const EdgeInsets.all(20),
  });

  final String title;
  final TextStyle? titleStyle;
  final Widget? child;
  final List<Widget>? actions;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: titleStyle ?? theme.textTheme.titleMedium,
                  ),
                ),
                if (actions != null) ...actions!,
              ],
            ),
            const SizedBox(height: 12),
            if (child != null) child!,
          ],
        ),
      ),
    );
  }
}

/// Small status pill (connected / active / idle / error / warning).
class StatusPill extends StatelessWidget {
  const StatusPill({
    super.key,
    required this.label,
    this.kind = StatusKind.idle,
  });

  enum StatusKind { idle, active, success, warning, error, disabled }

  final String label;
  final StatusKind kind;

  Color get _background => switch (kind) {
        StatusKind.idle => AppColors.surfaceVariant,
        StatusKind.active => AppColors.primary,
        StatusKind.success => AppColors.success,
        StatusKind.warning => AppColors.warning,
        StatusKind.error => AppColors.error,
        StatusKind.disabled => AppColors.disabled,
      };

  Color get _foreground => switch (kind) {
        StatusKind.idle => AppColors.onSurfaceVariant,
        StatusKind.active => AppColors.onPrimary,
        StatusKind.success => AppColors.onSuccess,
        StatusKind.warning => AppColors.onWarning,
        StatusKind.error => AppColors.onError,
        StatusKind.disabled => AppColors.surface,
      };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      constraints: const BoxConstraints(minWidth: 64),
      decoration: BoxDecoration(
        color: _background,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .labelSmall
            .copyWith(color: _foreground),
      ),
    );
  }
}

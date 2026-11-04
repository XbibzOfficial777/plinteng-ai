import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

/// Loading state with the brand spinner.
class LoadingState extends StatelessWidget {
  const LoadingState({
    super.key,
    this.label = 'Loading',
    this.height,
  });

  final String label;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: SizedBox(
        height: height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              color: theme.colorScheme.primary,
              strokeWidth: 3,
            ),
            const SizedBox(height: 12),
            Text(label, style: theme.textTheme.bodySmall),
          ],
        ),
      ),
    );
  }
}

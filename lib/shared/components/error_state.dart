import 'package:flutter/material.dart';

/// Error state with icon, title, description, and retry action.
class ErrorState extends StatelessWidget {
  const ErrorState({
    super.key,
    required this.title,
    this.description,
    this.onRetry,
  });

  final String title;
  final String? description;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: AppColors.error.withOpacity(0.12),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Icon(Icons.error_outline, size: 32, color: AppColors.error),
            ),
            const SizedBox(height: 16),
            Text(title, style: theme.textTheme.headlineSmall),
            if (description != null) ...[
              const SizedBox(height: 8),
              Text(
                description!,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
            ],
            if (onRetry != null) ...[
              const SizedBox(height: 16),
              TextButton(onPressed: onRetry, child: const Text('Coba lagi')),
            ],
          ],
        ),
      ),
    );
  }
}

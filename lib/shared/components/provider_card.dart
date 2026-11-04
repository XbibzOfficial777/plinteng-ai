import 'package:flutter/material.dart';

import '../../core/widgets/section_card.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';

/// Provider card — shows provider name, model, key status and a verify button.
///
/// Never claims a provider is active without a successful verification.
class ProviderCard extends StatelessWidget {
  const ProviderCard({
    super.key,
    required this.name,
    required this.model,
    required this.isKeySet,
    required this.isVerified,
    required this.isDefault,
    this.onConfigure,
  });

  final String name;
  final String model;
  final bool isKeySet;
  final bool isVerified;
  final bool isDefault;
  final VoidCallback? onConfigure;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            isDefault ? Icons.verified_outlined : Icons.cloud_outlined,
            size: 20,
            color: theme.colorScheme.onPrimaryContainer,
          ),
        ),
        title: Text(
          name,
          style: theme.textTheme.titleMedium,
        ),
        subtitle: Text(
          'Model: $model',
          style: theme.textTheme.bodySmall,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            StatusPill(
              label: isVerified ? 'Terverifikasi' : (isKeySet ? 'Belum diverifikasi' : 'Kunci belum diisi'),
              kind: isVerified
                  ? StatusKind.success
                  : (isKeySet ? StatusKind.warning : StatusKind.disabled),
            ),
            if (isDefault) ...[const SizedBox(height: 6), Text('Default', style: AppTypography.labelSmall)],
          ],
        ),
        onTap: onConfigure,
      ),
    );
  }
}

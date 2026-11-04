import 'package:flutter/material.dart';

import '../../core/widgets/section_card.dart';

/// Reusable activity row card (icon, title, subtitle, time, status pill).
class ActivityItemCard extends StatelessWidget {
  const ActivityItemCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.kindLabel,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final String time;
  final String kindLabel;
  final VoidCallback? onTap;

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
            icon,
            size: 20,
            color: theme.colorScheme.onPrimaryContainer,
          ),
        ),
        title: Text(title, style: theme.textTheme.bodyMedium),
        subtitle: Text(subtitle, style: theme.textTheme.bodySmall),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(time, style: theme.textTheme.bodySmall),
            const SizedBox(height: 4),
            StatusPill(
              label: kindLabel,
              kind: _kindOf(kindLabel),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }

  StatusKind _kindOf(String s) {
    switch (s) {
      case 'Error':
        return StatusKind.error;
      case 'Otomatisasi':
        return StatusKind.active;
      default:
        return StatusKind.success;
    }
  }
}

import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Agent avatar — circular badge with the agent initial.
class AgentAvatar extends StatelessWidget {
  const AgentAvatar({
    super.key,
    required this.name,
    this.size = 40,
    this.isActive = false,
  });

  final String name;
  final double size;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final initial = name.isNotEmpty ? name.characters.first.toUpperCase() : '?';

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          initial,
          style: theme.textTheme.titleMedium.copyWith(
            color: theme.colorScheme.onPrimaryContainer,
            fontSize: size * 0.42,
          ),
        ),
      ),
    );
  }
}

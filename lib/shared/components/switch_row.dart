import 'package:flutter/material.dart';

/// A settings row: leading icon, title, subtitle, optional trailing value,
/// and a switch. Used across settings and agent configuration screens.
class SwitchRow extends StatelessWidget {
  const SwitchRow({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.value,
    this.onChanged,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final bool? value;
  final ValueChanged<bool>? onChanged;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Icon(icon, size: 22, color: theme.colorScheme.primary),
      title: Text(title, style: theme.textTheme.bodyMedium),
      subtitle: subtitle != null ? Text(subtitle!, style: theme.textTheme.bodySmall) : null,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (value != null && onChanged != null)
            Switch(
              value: value!,
              onChanged: onChanged,
            ),
          if (trailing != null) ...[const SizedBox(width: 8), trailing!],
        ],
      ),
      onTap: value == null ? () => {} : null,
    );
  }
}

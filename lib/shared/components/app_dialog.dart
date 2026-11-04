import 'package:flutter/material.dart';

/// App-styled alert dialog with title, message, and confirm/cancel actions.
class AppDialog extends StatelessWidget {
  const AppDialog({
    super.key,
    required this.title,
    this.message,
    this.confirmLabel = 'OK',
    this.cancelLabel,
    this.onConfirm,
    this.onCancel,
    this.icon,
  });

  final String title;
  final String? message;
  final String confirmLabel;
  final String? cancelLabel;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Row(
        children: [
          if (icon != null)
            Icon(icon, size: 22, color: theme.colorScheme.primary),
          const SizedBox(width: 8),
          Expanded(child: Text(title)),
        ],
      ),
      content: message != null ? Text(message!) : null,
      actions: [
        if (cancelLabel != null)
          TextButton(
            onPressed: onCancel ?? Navigator.of(context).maybePop,
            child: Text(cancelLabel!),
          ),
        TextButton(
          onPressed: onConfirm ?? Navigator.of(context).maybePop,
          child: Text(confirmLabel),
        ),
      ],
    );
  }
}

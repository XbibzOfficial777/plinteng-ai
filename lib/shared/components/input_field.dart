import 'package:flutter/material.dart';

/// App-styled text input with a label and trailing slot.
class AppInput extends StatelessWidget {
  const AppInput({
    super.key,
    required this.label,
    this.hint,
    this.keyboardType,
    this.maxLines = 1,
    this.trailing,
    this.onChanged,
    this.obscureText = false,
  });

  final String label;
  final String? hint;
  final TextInputType? keyboardType;
  final int maxLines;
  final Widget? trailing;
  final ValueChanged<String>? onChanged;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: theme.textTheme.titleMedium),
        const SizedBox(height: 8),
        TextField(
          keyboardType: keyboardType,
          maxLines: maxLines,
          minLines: maxLines == 1 ? 1 : null,
          obscureText: obscureText,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hint,
            suffix: trailing,
          ),
        ),
      ],
    );
  }
}

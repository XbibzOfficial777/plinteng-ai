import 'package:flutter/material.dart';

/// Application scaffold with brand header.
///
/// Used by top-level screens to keep a consistent header (brand + optional
/// agent selector + optional actions).
class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.title,
    this.subtitle,
    this.actions,
    this.body,
    this.bottomBar,
    this.onSelectAgent,
    this.currentAgentLabel,
  });

  final String title;
  final String? subtitle;
  final List<Widget>? actions;
  final Widget? body;
  final Widget? bottomBar;
  final String? currentAgentLabel;
  final void Function()? onSelectAgent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 72,
            title: Text(title),
            subtitle: subtitle != null ? Text(subtitle!) : null,
            actions: actions,
          ),
          if (currentAgentLabel != null && onSelectAgent != null)
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 4),
                child: Row(
                  children: [
                    const Icon(Icons.smart_toy_outlined, size: 18),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        currentAgentLabel!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    TextButton(onPressed: onSelectAgent, child: const Text('Pilih')),
                  ],
                ),
              ),
            ),
          if (body != null) SliverFillRemaining(hasBody: true, child: body!),
        ],
      ),
      bottomNavigationBar: bottomBar,
    );
  }
}

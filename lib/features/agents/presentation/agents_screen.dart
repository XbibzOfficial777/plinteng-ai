import 'package:flutter/material.dart';

import '../../../core/widgets/app_scaffold.dart';
import '../../../core/widgets/section_card.dart';
import '../../../theme/app_colors.dart';

/// Agents — management screen.
///
/// List of agents with create/edit/duplicate/delete/select actions.
/// Full CRUD UI lands in Phase 3 with persistence.
class AgentsScreen extends StatelessWidget {
  const AgentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppScaffold(
      title: 'Agents',
      subtitle: 'Kelola asisten AI Anda',
      actions: [
        FloatingActionButton.extended(
          onPressed: () {},
          icon: const Icon(Icons.add),
          label: const Text('Agent baru'),
        ),
      ],
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: [
          Text(
            'Setiap agent punya kepribadian, penyedia AI, integrasi, dan percakapan tersendiri.',
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          _AgentCard(
            name: 'Linca',
            role: 'Asisten utama',
            personality: 'Ramah · profesional · hangat',
            status: 'Siap bekerja',
          ),
          const SizedBox(height: 12),
          _AgentCard(
            name: 'Kelompok CS',
            role: 'Balas pelanggan',
            personality: 'Formal · singkat · sopan',
            status: 'Idle',
          ),
        ],
      ),
    );
  }
}

class _AgentCard extends StatelessWidget {
  const _AgentCard({required this.name, required this.role, required this.personality, required this.status});
  final String name;
  final String role;
  final String personality;
  final String status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: theme.colorScheme.primaryContainer,
          child: Icon(
            Icons.smart_toy,
            color: theme.colorScheme.onPrimaryContainer,
          ),
        ),
        title: Text(name, style: theme.textTheme.titleMedium),
        subtitle: Text(
          '$role · $personality',
          style: theme.textTheme.bodySmall,
        ),
        trailing: StatusPill(
          label: status,
          kind: status == 'Siap bekerja'
              ? StatusPill.StatusKind.success
              : StatusPill.StatusKind.idle,
        ),
        onTap: () {},
      ),
    );
  }
}

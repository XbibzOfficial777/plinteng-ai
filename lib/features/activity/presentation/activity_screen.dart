import 'package:flutter/material.dart';

import '../../../core/widgets/app_scaffold.dart';
import '../../../core/widgets/section_card.dart';
import '../../../theme/app_colors.dart';

/// Activity — history center.
///
/// Date-grouped activity with filters and search. Pagination/lazy rendering
/// for large collections (Phase 4).
class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppScaffold(
      title: 'Activity',
      subtitle: 'Riwayat aktivitas agent',
      actions: [
        IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}),
        IconButton(icon: const Icon(Icons.search), onPressed: () {}),
      ],
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: [
          _GroupHeader(label: 'Hari ini'),
          _ActivityItem(
            icon: Icons.chat_bubble_outline,
            title: 'Balasan otomatis di WhatsApp',
            subtitle: 'Pelanggan “Rina” · “Halo Kak”',
            time: '10:32',
            kind: 'Balasan',
          ),
          _ActivityItem(
            icon: Icons.photo_library_outlined,
            title: 'Posting Instagram selesai',
            subtitle: '3 item · 18:00',
            time: '09:15',
            kind: 'Otomatisasi',
          ),
          const SizedBox(height: 16),
          _GroupHeader(label: 'Kemarin'),
          _ActivityItem(
            icon: Icons.error_outline,
            title: 'Gagal mengirim pesan',
            subtitle: 'Akses notifikasi belum diberikan',
            time: '17:02',
            kind: 'Error',
          ),
        ],
      ),
    );
  }
}

class _GroupHeader extends StatelessWidget {
  const _GroupHeader({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(label, style: Theme.of(context).textTheme.titleSmall),
    );
  }
}

class _ActivityItem extends StatelessWidget {
  const _ActivityItem({required this.icon, required this.title, required this.subtitle, required this.time, required this.kind});
  final IconData icon;
  final String title;
  final String subtitle;
  final String time;
  final String kind;

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
          child: Icon(icon, size: 20, color: theme.colorScheme.onPrimaryContainer),
        ),
        title: Text(title, style: theme.textTheme.bodyMedium),
        subtitle: Text(subtitle, style: theme.textTheme.bodySmall),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(time, style: theme.textTheme.bodySmall),
            StatusPill(label: kind, kind: _kindOf(kind)),
          ],
        ),
        onTap: () {},
      ),
    );
  }

  StatusPill.StatusKind _kindOf(String s) {
    switch (s) {
      case 'Error':
        return StatusPill.StatusKind.error;
      case 'Otomatisasi':
        return StatusPill.StatusKind.active;
      default:
        return StatusPill.StatusKind.success;
    }
  }
}

import 'package:flutter/material.dart';

import '../../../core/widgets/app_scaffold.dart';
import '../../../shared/components/activity_item.dart';

/// Activity — history center.
///
/// Date-grouped activity with filters and search. Pagination/lazy rendering
/// for large collections (Phase 4).
class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          ActivityItemCard(
            icon: Icons.chat_bubble_outline,
            title: 'Balasan otomatis di WhatsApp',
            subtitle: 'Pelanggan “Rina” · “Halo Kak”',
            time: '10:32',
            kindLabel: 'Balasan',
          ),
          ActivityItemCard(
            icon: Icons.photo_library_outlined,
            title: 'Posting Instagram selesai',
            subtitle: '3 item · 18:00',
            time: '09:15',
            kindLabel: 'Otomatisasi',
          ),
          const SizedBox(height: 16),
          _GroupHeader(label: 'Kemarin'),
          ActivityItemCard(
            icon: Icons.error_outline,
            title: 'Gagal mengirim pesan',
            subtitle: 'Akses notifikasi belum diberikan',
            time: '17:02',
            kindLabel: 'Error',
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

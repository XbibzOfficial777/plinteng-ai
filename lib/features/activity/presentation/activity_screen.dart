import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/widgets/app_scaffold.dart';
import '../../../core/widgets/section_card.dart';
import '../../../shared/components/activity_item.dart';
import '../../../shared/models/activity.dart';
import '../data/activity_repository.dart';

/// Activity — history center.
///
/// Real history from the local database: every conversation, provider
/// event, and automation run is appended here as it happens.
class ActivityScreen extends ConsumerWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activity = ref.watch(activityProvider);

    return AppScaffold(
      title: 'Activity',
      subtitle: 'Riwayat aktivitas agent',
      actions: [
        IconButton(
          icon: const Icon(Icons.filter_list),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
      ],
      body: activity.when(
        data: (list) {
          if (list.isEmpty) {
            return const _EmptyActivity();
          }
          return ListView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
            children: [
              for (final group in _groupByDay(list))
                ...[
                  _GroupHeader(label: group.$1),
                  for (final item in group.$2)
                    ActivityItemCard(
                      icon: _iconFor(item.kind),
                      title: item.title,
                      subtitle: item.details.isEmpty ? '—' : item.details,
                      time: '${item.createdAt.hour}:${item.createdAt.minute.toString().padLeft(2, '0')}',
                      kindLabel: _kindLabel(item.kind),
                    ),
                  const SizedBox(height: 8),
                ],
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, s) => Center(child: Text('Gagal memuat: $e')),
      ),
    );
  }
}

List<(String, List<ActivityItem>)> _groupByDay(List<ActivityItem> items) {
  final groups = <String, List<ActivityItem>>{};
  for (final item in items) {
    final key = _dayKey(item.createdAt);
    groups.putIfAbsent(key, () => []).add(item);
  }
  return groups.entries.map((e) => (e.key, e.value)).toList();
}

String _dayKey(DateTime d) {
  final now = DateTime.now();
  if (d.day == now.day &&
      d.month == now.month &&
      d.year == now.year) {
    return 'Hari ini';
  }
  final yesterday = now.subtract(const Duration(days: 1));
  if (d.day == yesterday.day &&
      d.month == yesterday.month &&
      d.year == yesterday.year) {
    return 'Kemarin';
  }
  return '${d.day} ${_monthName(d.month)} ${d.year}';
}

String _monthName(int m) => switch (m) {
      1 => 'Jan',
      2 => 'Feb',
      3 => 'Mar',
      4 => 'Apr',
      5 => 'Mei',
      6 => 'Jun',
      7 => 'Jul',
      8 => 'Agu',
      9 => 'Sep',
      10 => 'Okt',
      11 => 'Nov',
      12 => 'Des',
      _ => '$m',
    };

IconData _iconFor(ActivityKind kind) => switch (kind) {
      ActivityKind.conversation => Icons.chat_bubble_outline,
      ActivityKind.notification => Icons.notifications_outlined,
      ActivityKind.suggestedReply => Icons.lightbulb_outline,
      ActivityKind.sentReply => Icons.send_outlined,
      ActivityKind.automation => Icons.bolt_outlined,
      ActivityKind.scheduledTask => Icons.schedule_outlined,
      ActivityKind.providerEvent => Icons.cloud_sync_outlined,
      ActivityKind.error => Icons.error_outline,
    };

String _kindLabel(ActivityKind kind) => switch (kind) {
      ActivityKind.conversation => 'Chat',
      ActivityKind.notification => 'Notifikasi',
      ActivityKind.suggestedReply => 'Saran balasan',
      ActivityKind.sentReply => 'Balasan terkirim',
      ActivityKind.automation => 'Otomatisasi',
      ActivityKind.scheduledTask => 'Tugas terjadwal',
      ActivityKind.providerEvent => 'Penyedia',
      ActivityKind.error => 'Error',
    };

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

class _EmptyActivity extends StatelessWidget {
  const _EmptyActivity();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.history_outlined, size: 48),
          const SizedBox(height: 16),
          Text(
            'Belum ada aktivitas.\nAktivitas agent akan muncul di sini.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

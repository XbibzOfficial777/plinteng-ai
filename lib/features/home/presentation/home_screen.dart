import 'package:flutter/material.dart';

import '../../../core/widgets/app_scaffold.dart';
import '../../../core/widgets/section_card.dart';
import '../../../shared/rive/mascot_state.dart';
import '../../../shared/rive/rive_mascot.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';

/// Home — primary companion screen.
///
/// Brand header, agent selector, mascot area, status, quick actions,
/// daily stats, today's schedule, recent activity, shortcuts.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppScaffold(
      title: 'Plinteng AI',
      subtitle: 'Companion & automation',
      currentAgentLabel: 'Linca · Siap bekerja',
      onSelectAgent: () {},
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 96),
        children: [
          // ---- Mascot area (Rive, driven by app state) ----
          Center(child: RiveMascot(initialState: MascotState.idle)),
          const SizedBox(height: 20),

          // ---- Status row ----
          Row(
            children: [
              Expanded(
                child: StatusPill(label: 'Siap bekerja', kind: StatusPill.StatusKind.success),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: StatusPill(label: 'Automasi aktif', kind: StatusPill.StatusKind.active),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // ---- Quick actions ----
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _QuickAction(icon: Icons.chat_outlined, label: 'Chat', onTap: () {}),
              _QuickAction(icon: Icons.schedule_outlined, label: 'Tugas', onTap: () {}),
              _QuickAction(icon: Icons.bolt_outlined, label: 'Otomatisasi', onTap: () {}),
              _QuickAction(icon: Icons.cloud_sync_outlined, label: 'Penyedia', onTap: () {}),
            ],
          ),
          const SizedBox(height: 20),

          // ---- Daily stats ----
          Row(
            children: [
              Expanded(child: _StatTile(label: 'Tugas hari ini', value: '12')),
              const SizedBox(width: 12),
              Expanded(child: _StatTile(label: 'Balasan otomatis', value: '34')),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _StatTile(label: 'Pesan dibaca', value: '28')),
              const SizedBox(width: 12),
              Expanded(child: _StatTile(label: 'Kesalahan', value: '0')),
            ],
          ),
          const SizedBox(height: 20),

          // ---- Today's schedule ----
          SectionCard(
            title: 'Jadwal hari ini',
            actions: [
              TextButton(
                onPressed: () {},
                child: Text('Lihat semua', style: theme.textTheme.labelLarge),
              ),
            ],
            child: Column(
              children: [
                _ScheduleRow(time: '08:00', title: 'Posting Instagram', status: 'Selesai'),
                _ScheduleRow(time: '10:30', title: 'Balas chat pelanggan', status: 'Berjalan'),
                _ScheduleRow(time: '18:00', title: 'Posting TikTok', status: 'Terjadwal'),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // ---- Recent activity ----
          SectionCard(
            title: 'Aktivitas terbaru',
            child: Column(
              children: [
                _ActivityRow(
                  icon: Icons.chat_bubble_outline,
                  title: 'Balasan otomatis di WhatsApp',
                  subtitle: 'Pelanggan “Rina” · “Halo Kak”',
                  time: '10:32',
                ),
                _ActivityRow(
                  icon: Icons.photo_library_outlined,
                  title: 'Posting Instagram selesai',
                  subtitle: '3 item · 18:00',
                  time: '09:15',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // ---- Shortcuts ----
          SectionCard(
            title: 'Pintasan',
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _Shortcut(icon: Icons.person_add_outlined, label: 'Tambah agent'),
                _Shortcut(icon: Icons.add_box_outlined, label: 'Otomatisasi baru'),
                _Shortcut(icon: Icons.gpp_good_outlined, label: 'Izin notifikasi'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickAction extends StatelessWidget {
  const _QuickAction({required this.icon, required this.label, required this.onTap});
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 84,
      height: 84,
     decoration: BoxDecoration(
        color: theme.colorScheme.elevatedSurface,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(color: Color(0x14000000), blurRadius: 8, offset: Offset(0, 4)),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 26, color: theme.colorScheme.primary),
            const SizedBox(height: 6),
            Text(label, style: theme.textTheme.labelMedium),
          ],
        ),
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(value, style: AppTypography.displayMedium),
          const SizedBox(height: 2),
          Text(label, style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }
}

class _ScheduleRow extends StatelessWidget {
  const _ScheduleRow({required this.time, required this.title, required this.status});
  final String time;
  final String title;
  final String status;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Container(
          width: 56,
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(time, style: theme.textTheme.labelSmall),
        ),
        const SizedBox(width: 12),
        Expanded(child: Text(title, style: theme.textTheme.bodyMedium)),
        StatusPill(label: status, kind: _statusKind(status)),
      ],
    );
  }

  StatusPill.StatusKind _statusKind(String s) {
    switch (s) {
      case 'Selesai':
        return StatusPill.StatusKind.success;
      case 'Berjalan':
        return StatusPill.StatusKind.active;
      default:
        return StatusPill.StatusKind.idle;
    }
  }
}

class _ActivityRow extends StatelessWidget {
  const _ActivityRow({required this.icon, required this.title, required this.subtitle, required this.time});
  final IconData icon;
  final String title;
  final String subtitle;
  final String time;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: 20, color: theme.colorScheme.onPrimaryContainer),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: theme.textTheme.bodyMedium),
              const SizedBox(height: 2),
              Text(subtitle, style: theme.textTheme.bodySmall),
            ],
          ),
        ),
        Text(time, style: theme.textTheme.bodySmall),
      ],
    );
  }
}

class _Shortcut extends StatelessWidget {
  const _Shortcut({required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.elevatedSurface,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 18, color: theme.colorScheme.primary),
          const SizedBox(width: 8),
          Text(label, style: theme.textTheme.labelMedium),
        ],
      ),
    );
  }
}

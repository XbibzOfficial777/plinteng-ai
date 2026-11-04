import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/app_scaffold.dart';
import '../../../core/widgets/section_card.dart';
import '../../../shared/components/switch_row.dart';

/// Settings — structured settings center.
///
/// Groups: Application · AI · Messaging · Android permissions · Privacy.
/// Settings persist (Phase 3+).
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Settings',
      subtitle: 'Pengaturan aplikasi',
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        children: [
          SectionCard(
            title: 'Aplikasi',
            child: Column(
              children: [
                SwitchRow(icon: Icons.vibration_outlined, title: 'Haptic feedback', subtitle: 'Getaran saat interaksi', value: true, onChanged: (_) {}),
                SwitchRow(icon: Icons.animation_outlined, title: 'Animasi', subtitle: 'Ikuti preferensi sistem', value: true, onChanged: (_) {}),
                _SettingRow(icon: Icons.dark_mode_outlined, title: 'Tema', subtitle: 'Cahaya / gelap'),
                _SettingRow(icon: Icons.translate_outlined, title: 'Bahasa', subtitle: 'Bahasa Indonesia'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SectionCard(
            title: 'AI',
            child: Column(
              children: [
                _SettingRow(icon: Icons.cloud_sync_outlined, title: 'Penyedia AI', subtitle: 'OpenAI · Gemini · Claude', onTap: () => context.push('/settings/ai')),
                _SettingRow(icon: Icons.psychology_outlined, title: 'Model default', subtitle: 'Auto'),
                _SettingRow(icon: Icons.smart_toy_outlined, title: 'Agent', subtitle: 'Linca'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SectionCard(
            title: 'Pesan',
            child: Column(
              children: [
                _SettingRow(icon: Icons.notifications_outlined, title: 'Akses notifikasi', subtitle: 'Diizinkan'),
                _SettingRow(icon: Icons.forum_outlined, title: 'Platform', subtitle: 'WhatsApp · Telegram'),
                SwitchRow(icon: Icons.autorenew_outlined, title: 'Balasan otomatis', subtitle: 'Balasan otomatis oleh agent', value: false, onChanged: (_) {}),
                _SettingRow(icon: Icons.bedtime_outlined, title: 'Jam tenang', subtitle: '22:00 – 07:00'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SectionCard(
            title: 'Izin Android',
            child: Column(
              children: [
                _SettingRow(icon: Icons.notifications_outlined, title: 'Akses notifikasi', subtitle: 'Diizinkan'),
                _SettingRow(icon: Icons.draw_outlined, title: 'Tampil di atas aplikasi', subtitle: 'Diizinkan'),
                _SettingRow(icon: Icons.battery_full_outlined, title: 'Hemat baterai', subtitle: 'Diizinkan'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SectionCard(
            title: 'Privasi',
            child: Column(
              children: [
                _SettingRow(icon: Icons.delete_sweep_outlined, title: 'Hapus percakapan', subtitle: 'Hapus semua'),
                _SettingRow(icon: Icons.lock_outlined, title: 'Kunci API', subtitle: 'Kelola kunci'),
                _SettingRow(icon: Icons.restart_alt_outlined, title: 'Reset data lokal', subtitle: 'Reset'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingRow extends StatelessWidget {
  const _SettingRow({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Icon(icon, size: 22, color: theme.colorScheme.primary),
      title: Text(title, style: theme.textTheme.bodyMedium),
      subtitle: Text(subtitle, style: theme.textTheme.bodySmall),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

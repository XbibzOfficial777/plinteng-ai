import 'package:flutter/material.dart';

import '../../../core/widgets/app_scaffold.dart';
import '../../../core/widgets/section_card.dart';

/// Settings — structured settings center.
///
/// Groups: Application · AI · Messaging · Android permissions · Privacy.
/// Settings persist (Phase 3+).
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                _SettingRow(icon: Icons.dark_mode_outlined, title: 'Tema', subtitle: 'Cahaya / gelap'),
                _SettingRow(icon: Icons.translate_outlined, title: 'Bahasa', subtitle: 'Bahasa Indonesia'),
                _SettingRow(icon: Icons.vibration_outlined, title: 'Haptic', subtitle: 'Nyalakan'),
                _SettingRow(icon: Icons.animation_outlined, title: 'Animasi', subtitle: 'Standar'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SectionCard(
            title: 'AI',
            child: Column(
              children: [
                _SettingRow(icon: Icons.cloud_sync_outlined, title: 'Penyedia AI', subtitle: 'OpenAI · Gemini · Claude'),
                _SettingRow(icon: Icons.model_outlined, title: 'Model default', subtitle: 'Auto'),
                _SettingRow(icon: Icons.robot_outlined, title: 'Agent', subtitle: 'Linca'),
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
                _SettingRow(icon: Icons.autorenew_outlined, title: 'Balasan otomatis', subtitle: 'Dimatikan'),
                _SettingRow(icon: Icons.bedtime_outlined, title: 'Jam tenang', subtitle: '22:00 – 07:00'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          SectionCard(
            title: 'Izin Android',
            child: Column(
              children: [
                _SettingRow(icon: Icons.notification_listener_outlined, title: 'Akses notifikasi', subtitle: 'Diizinkan'),
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
  const _SettingRow({required this.icon, required this.title, required this.subtitle});
  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      leading: Icon(icon, size: 22, color: theme.colorScheme.primary),
      title: Text(title, style: theme.textTheme.bodyMedium),
      subtitle: Text(subtitle, style: theme.textTheme.bodySmall),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {},
    );
  }
}

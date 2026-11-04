import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'app/providers/app_state_provider.dart';
import 'router/app_router.dart';
import 'theme/app_theme.dart';

/// Root application widget.
///
/// Theme is token-driven (light + deliberately designed dark).
/// Navigation is centralized in [AppRouter].
class PlintengApp extends ConsumerWidget {
  const PlintengApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final goRouter = AppRouter.router;

    return MaterialApp.router(
      title: 'Plinteng AI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      routerConfig: goRouter,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('id'),
        Locale('en'),
      ],
    );
  }
}

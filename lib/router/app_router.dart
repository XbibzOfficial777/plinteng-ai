import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/activity/presentation/activity_screen.dart';
import '../features/agents/presentation/agents_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/settings/presentation/settings_screen.dart';
import 'routes.dart';

/// The application router.
///
/// Shell: 4 deliberate destinations. Feature screens are pushed above the
/// shell. All routes are centralized in [AppRoutes].
final class AppRouter {
  AppRouter._();

  static final GoRouter _router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: <RouteBase>[
      StatefulShellRoute.bottomNavigationBar(
        builder: (BuildContext context, StatefulNavigationShell state,
            Widget Function(BuildContext, StatefulNavigationShell)? nextShell) {
          return _PlintengShell(
            state: state,
            nextShell: nextShell,
          );
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.home,
                builder: (_, __) => const HomeScreen(),
              ),
              GoRoute(
                path: AppRoutes.conversation,
                builder: (_, __) => const _PlaceholderScreen(
                  title: 'Conversation',
                ),
              ),
              GoRoute(
                path: AppRoutes.conversationForAgent,
                builder: (_, __) => const _PlaceholderScreen(
                  title: 'Agent conversation',
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.agents,
                builder: (_, __) => const AgentsScreen(),
              ),
              GoRoute(
                path: AppRoutes.agentDetail,
                builder: (_, __) => const _PlaceholderScreen(
                  title: 'Agent',
                ),
              ),
              GoRoute(
                path: AppRoutes.agentCreate,
                builder: (_, __) => const _PlaceholderScreen(
                  title: 'New agent',
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.activity,
                builder: (_, __) => const ActivityScreen(),
              ),
              GoRoute(
                path: AppRoutes.activityDetail,
                builder: (_, __) => const _PlaceholderScreen(
                  title: 'Activity',
                ),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.settings,
                builder: (_, __) => const SettingsScreen(),
              ),
              GoRoute(
                path: AppRoutes.settingsAi,
                builder: (_, __) => const _PlaceholderScreen(
                  title: 'AI settings',
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  static GoRouter get router => _router;
}

/// Bottom-navigation shell. Only 4 destinations — deliberate hierarchy.
class _PlintengShell extends StatelessWidget {
  const _PlintengShell({
    required this.state,
    required this.nextShell,
  });

  final StatefulNavigationShell state;
  final Widget Function(BuildContext, StatefulNavigationShell)? nextShell;

  static const _destinations = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.smart_toy_outlined),
      activeIcon: Icon(Icons.smart_toy),
      label: 'Agents',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.history_outlined),
      activeIcon: Icon(Icons.history),
      label: 'Activity',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings_outlined),
      activeIcon: Icon(Icons.settings),
      label: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: nextShell?.call(context, state) ??
          Navigator(
            key: state.navigatorKey,
            onPopPage: (route, result) =>
                route.didPop(result) ?? !route.willPop(result),
          ),
      bottomNavigationBar: BottomNavigationBar(
        items: _destinations,
        currentIndex: state.currentIndex,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
        onTap: (index) => state.goBranch(
          index,
          initialLocation: index == state.currentIndex,
        ),
      ),
    );
  }
}

/// Minimal placeholder for screens built in later phases.
class _PlaceholderScreen extends StatelessWidget {
  const _PlaceholderScreen({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          '$title — build in phase',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}

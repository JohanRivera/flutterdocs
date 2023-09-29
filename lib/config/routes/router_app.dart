import 'package:flutter/material.dart';
import 'package:flutterdocs/presentation/widgets/scaffold_with_nestednavigation.dart';
import 'package:go_router/go_router.dart';
import 'package:flutterdocs/presentation/views/views.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');

// GoRouter configuration
final routerApp = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // the UI shell
        return ScaffoldWithNestedNavigation(
          navigationShell: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            GoRoute(
              path: '/',
              pageBuilder: (context, state) => NoTransitionPage(
                child: SizedBox(
                  height: 50.0,
                  width: 50.0,
                  child: IconButton(
                    onPressed: () {
                      context.push('/listview');
                    },
                    icon: const Icon(Icons.abc),
                  ),
                ),
              ),
              routes: [
                // child route
                GoRoute(
                  path: 'listview',
                  builder: (context, state) => ListView(),
                ),
              ],
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
      ],
    ),
  ],
  debugLogDiagnostics: true,
);

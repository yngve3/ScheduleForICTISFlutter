import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:schedule_for_ictis_flutter/presentation/pages/event_add/event_add_page.dart';
import 'package:schedule_for_ictis_flutter/presentation/route/routes.dart';

import '../pages/favorite_schedules/pages/favorite_schedules_add/favorite_schedules_add_page.dart';
import '../pages/favorite_schedules/pages/favorite_schedules_list/favorite_schedules_list_page.dart';
import '../pages/main_page/main_page.dart';
import '../pages/preferences/preferences_page.dart';

import '../pages/schedule/schedule_page.dart';

abstract class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
  GlobalKey<NavigatorState>(debugLabel: 'root');
  static final GlobalKey<NavigatorState> _shellNavigatorKey =
  GlobalKey<NavigatorState>(debugLabel: 'main_page');

  static final GoRouter router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: Routes.schedule.path,
      debugLogDiagnostics: true,
      routes: [
        ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (BuildContext context, GoRouterState state, Widget child) {
              return MainPage(child: child);
            },
            routes: [
              GoRoute(
                path: Routes.schedule.path,
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return const NoTransitionPage(
                      child: SchedulePage()
                  );
                },
                routes: [
                  GoRoute(
                    path: Routes.addEvent.lastPathComponent,
                    pageBuilder: (BuildContext context, GoRouterState state) {
                      return const NoTransitionPage(
                          child: EventAddPage()
                      );
                    },
                    routes: const []
                  )
                ],
              ),
              GoRoute(
                path: Routes.preferences.path,
                pageBuilder: (BuildContext context, GoRouterState state) {
                  return const NoTransitionPage(
                      child: PreferencesPage()
                  );
                },
                routes: [
                  GoRoute(
                    path: Routes.favoriteSchedules.lastPathComponent,
                    builder: (BuildContext context, GoRouterState state) {
                      return const FavoriteSchedulesListPage();
                    },
                    routes: [
                      GoRoute(
                        path: Routes.addFavoriteSchedule.lastPathComponent,
                        builder: (BuildContext context, GoRouterState state) {
                          return const FavoriteSchedulesAddPage();
                        },
                        routes: const [],
                      ),
                    ],
                  ),
                ],
              ),
            ]
        )
      ]
  );
}
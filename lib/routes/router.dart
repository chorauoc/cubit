import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../ui/home/view/home_screen.dart';

abstract class Routes {
  static const INITIAL = '/';
  static const DETAILS = 'details';
}

class RouteGenerator {
  final GoRouter routerConfig = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: Routes.INITIAL,
        builder: (BuildContext context, GoRouterState state) {
          return HomeScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: Routes.DETAILS,
            builder: (BuildContext context, GoRouterState state) {
              return const SizedBox();
            },
          ),
        ],
      ),
    ],
  );
}

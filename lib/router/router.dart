import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:passi_app/models/event_category.dart';
import 'package:passi_app/models/screen_args/event_categories_screen_args.dart';
import 'package:passi_app/models/screen_args/event_detail_sreen_args.dart';
import 'package:passi_app/screens/event_categories_overview_screen.dart';

import '../screens/event_details_screen.dart';
import '../screens/app_tabs.dart';

class AppRouter {
  late final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: AppTabs.route,
        name: AppTabs.name,
        builder: (BuildContext context, GoRouterState state) {
          return AppTabs();
        },
        routes: <RouteBase>[
          GoRoute(
            path: EventDetailsScreen.route,
            name: EventDetailsScreen.name,
            builder: (BuildContext context, GoRouterState state) {
              final EventDetailScreenArgs args = EventDetailScreenArgs.fromJson(state.queryParams);
              return EventDetailsScreen(
                id: args.id,
                imageUrl: args.imageUrl,
              );
            },
          ),
          GoRoute(
            path: EventCategoriesOverviewScreen.route,
            name: EventCategoriesOverviewScreen.name,
            builder: (BuildContext context, GoRouterState state) {
              final EventCategoriesOverviewScreenArgs args =
                  EventCategoriesOverviewScreenArgs.fromJson(state.params);
              return EventCategoriesOverviewScreen(
                id: args.id,
              );
            },
          ),
        ],
      ),
    ],
  );
}

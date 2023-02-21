import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:passi_app/models/screen_args/email_confirmation_screen_args.dart';
import 'package:passi_app/models/screen_args/event_categories_screen_args.dart';
import 'package:passi_app/models/screen_args/event_detail_screen_args.dart';
import 'package:passi_app/screens/email_register_screen.dart';
import 'package:passi_app/screens/error_screen.dart';
import 'package:passi_app/screens/event_categories_overview_screen.dart';
import 'package:passi_app/screens/event_checkout_screen.dart';
import '../models/screen_args/event_checkout_screen_args.dart';
import '../screens/email_confirmation_screen.dart';
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
              routes: [
                GoRoute(
                  path: EventCheckoutScreen.route,
                  name: EventCheckoutScreen.name,
                  builder: (BuildContext context, GoRouterState state) {
                    final args = EventCheckoutScreenArgs.fromJson(state.queryParams);
                    return EventCheckoutScreen(id: args.id);
                  },
                )
              ],
              builder: (BuildContext context, GoRouterState state) {
                final EventDetailScreenArgs args =
                    EventDetailScreenArgs.fromJson(state.queryParams);
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
                final args = EventCategoriesOverviewScreenArgs.fromJson(state.params);
                return EventCategoriesOverviewScreen(
                  id: args.id,
                );
              },
            ),
            GoRoute(
                path: EmailRegisterScreen.route,
                name: EmailRegisterScreen.name,
                builder: (BuildContext context, GoRouterState state) {
                  return EmailRegisterScreen();
                },
                routes: [
                  GoRoute(
                      path: EmailConfirmationScreen.route,
                      name: EmailConfirmationScreen.name,
                      builder: (context, state) {
                        final args = EmailConfirmationScreenArgs.fromJson(
                          state.queryParams,
                        );
                        return EmailConfirmationScreen(
                          email: args.email,
                          password: args.password,
                        );
                      })
                ])
          ],
        ),
      ],
      errorPageBuilder: (context, state) {
        return MaterialPage(child: ErrorScreen());
      });
}

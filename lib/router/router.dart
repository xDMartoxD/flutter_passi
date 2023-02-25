import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:passi_app/models/screen_args/email_confirmation_screen_args.dart';
import 'package:passi_app/models/screen_args/event_categories_screen_args.dart';
import 'package:passi_app/models/screen_args/event_detail_screen_args.dart';
import 'package:passi_app/screens/email_login_screen.dart';
import 'package:passi_app/screens/email_register_screen.dart';
import 'package:passi_app/screens/error_screen.dart';
import 'package:passi_app/screens/event_categories_overview_screen.dart';
import 'package:passi_app/screens/event_checkout_screen.dart';
import 'package:passi_app/screens/user_settings_screen.dart';
import '../models/screen_args/event_checkout_screen_args.dart';
import '../screens/email_confirmation_screen.dart';
import '../screens/event_details_screen.dart';
import '../screens/app_tabs.dart';

class AppRouter {
  late final GoRouter router = GoRouter(
      routes: [
        GoRoute(
          path: AppTabs.path,
          name: AppTabs.name,
          builder: (BuildContext context, GoRouterState state) {
            return AppTabs();
          },
          routes: [
            GoRoute(
              path: EventDetailsScreen.path,
              name: EventDetailsScreen.name,
              builder: (BuildContext context, GoRouterState state) {
                final args = EventDetailScreenArgs.fromJson(state.params);
                return EventDetailsScreen(
                  id: args.id,
                );
              },
            ),
            GoRoute(
              path: EventCheckoutScreen.path,
              name: EventCheckoutScreen.name,
              builder: (BuildContext context, GoRouterState state) {
                final args = EventCheckoutScreenArgs.fromJson(state.params);
                return EventCheckoutScreen(
                  id: args.id,
                );
              },
            ),
            GoRoute(
              path: EmailLoginScreen.path,
              name: EmailLoginScreen.name,
              builder: (context, state) {
                return EmailLoginScreen();
              },
            ),
            GoRoute(
              path: UserSettingsScreen.path,
              name: UserSettingsScreen.name,
              builder: (context, state) {
                return UserSettingsScreen();
              },
            ),
            GoRoute(
              path: EventCategoriesOverviewScreen.path,
              name: EventCategoriesOverviewScreen.name,
              builder: (BuildContext context, GoRouterState state) {
                final args = EventCategoriesOverviewScreenArgs.fromJson(state.params);
                return EventCategoriesOverviewScreen(
                  id: args.id,
                );
              },
            ),
            GoRoute(
              path: EmailRegisterScreen.path,
              name: EmailRegisterScreen.name,
              builder: (BuildContext context, GoRouterState state) {
                return EmailRegisterScreen();
              },
            ),
            GoRoute(
                path: EmailConfirmationScreen.path,
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
          ],
        ),
      ],
      errorPageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: ErrorScreen(
            error: state.error.toString(),
          ),
        );
      });
}

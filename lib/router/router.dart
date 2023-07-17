import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:passi_app/models/screen_args/reset_password_screen_args.dart';
import 'package:passi_app/models/screen_args/success_screen_args.dart';
import 'package:passi_app/screens/add_card_screen.dart';
import 'package:passi_app/screens/add_nequi_screen.dart';
import 'package:passi_app/screens/forgot_password_email.dart';
import 'package:passi_app/screens/payment_methods_screen.dart';
import 'package:passi_app/screens/reset_password_screen.dart';
import '../models/screen_args/email_confirmation_screen_args.dart';
import '../models/screen_args/errors_screen_args.dart';
import '../models/screen_args/event_categories_screen_args.dart';
import '../models/screen_args/event_detail_screen_args.dart';
import '../screens/email_login_screen.dart';
import '../screens/email_register_screen.dart';
import '../screens/errors_screen.dart';
import '../screens/event_categories_overview_screen.dart';
import '../screens/event_checkout_screen.dart';
import '../screens/success_screen.dart';
import '../screens/user_settings_screen.dart';
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
          return const AppTabs();
        },
        routes: [
          GoRoute(
            path: EventDetailsScreen.path,
            name: EventDetailsScreen.name,
            builder: (BuildContext context, GoRouterState state) {
              state.pathParameters.addAll(state.queryParameters);
              final args = EventDetailScreenArgs.fromJson(state.pathParameters);
              return EventDetailsScreen(
                id: args.id,
                promoterCode: args.code,
              );
            },
          ),
          GoRoute(
            path: EventCheckoutScreen.path,
            name: EventCheckoutScreen.name,
            builder: (BuildContext context, GoRouterState state) {
              final args = EventCheckoutScreenArgs.fromJson(
                {
                  ...state.pathParameters,
                  ...state.queryParameters,
                },
              );
              return EventCheckoutScreen(
                id: args.id,
                discountCode: args.discountCode,
              );
            },
          ),
          GoRoute(
            path: EmailLoginScreen.path,
            name: EmailLoginScreen.name,
            builder: (context, state) {
              return const EmailLoginScreen();
            },
          ),
          GoRoute(
            path: UserSettingsScreen.path,
            name: UserSettingsScreen.name,
            builder: (context, state) {
              return const UserSettingsScreen();
            },
          ),
          GoRoute(
            path: EventCategoriesOverviewScreen.path,
            name: EventCategoriesOverviewScreen.name,
            builder: (BuildContext context, GoRouterState state) {
              final args = EventCategoriesOverviewScreenArgs.fromJson(
                  state.queryParameters);
              return EventCategoriesOverviewScreen(
                id: args.id,
                categoryName: args.categoryName,
              );
            },
          ),
          GoRoute(
            path: EmailRegisterScreen.path,
            name: EmailRegisterScreen.name,
            builder: (BuildContext context, GoRouterState state) {
              return const EmailRegisterScreen();
            },
          ),
          GoRoute(
              path: EmailConfirmationScreen.path,
              name: EmailConfirmationScreen.name,
              builder: (context, state) {
                final args = EmailConfirmationScreenArgs.fromJson(
                  state.queryParameters,
                );
                return EmailConfirmationScreen(
                  email: args.email,
                  password: args.password,
                );
              }),
          GoRoute(
              path: PaymentMethodsScreen.path,
              name: PaymentMethodsScreen.name,
              builder: (context, state) {
                return PaymentMethodsScreen();
              }),
          GoRoute(
              path: AddCardScreen.path,
              name: AddCardScreen.name,
              builder: (context, state) {
                return const AddCardScreen();
              }),
          GoRoute(
              path: AddNequiScreen.path,
              name: AddNequiScreen.name,
              builder: (context, state) {
                return const AddNequiScreen();
              }),
          GoRoute(
              path: ErrorsScreen.path,
              name: ErrorsScreen.name,
              builder: (context, state) {
                final args = ErrorsScreenArgs.fromJson(
                  state.queryParameters,
                );
                return ErrorsScreen(error: args.error);
              }),
          GoRoute(
              path: SuccessScreen.path,
              name: SuccessScreen.name,
              builder: (context, state) {
                final args = SuccessScreenArgs.fromJson(state.queryParameters);
                return SuccessScreen(title: args.title, message: args.message);
              }),
          GoRoute(
              path: ForgotPasswordEmailScreen.path,
              name: ForgotPasswordEmailScreen.name,
              builder: (context, state) {
                return const ForgotPasswordEmailScreen();
              }),
          GoRoute(
              path: ResetPasswordScreen.path,
              name: ResetPasswordScreen.name,
              builder: (context, state) {
                final args =
                    ResetPasswordScreenArgs.fromJson(state.pathParameters);
                return ResetPasswordScreen(
                  username: args.username,
                );
              }),
        ],
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: ErrorsScreen(
          error: state.error.toString(),
        ),
      );
    },
  );
}

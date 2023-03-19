import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:passi_app/providers/discount_code_provider.dart';
import 'package:passi_app/providers/authentication_provider.dart';
import 'package:passi_app/providers/event_categories_provider.dart';
import 'package:passi_app/providers/internet_provider.dart';
import 'package:passi_app/router/router.dart';
import 'package:passi_app/theme/theme_constants.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(conectivity: Connectivity()));
}

class MyApp extends StatelessWidget {
  final Connectivity conectivity;
  const MyApp({super.key, required this.conectivity});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<Internet>(
            create: (_) => Internet(connectivity: conectivity),
          ),
          ChangeNotifierProvider<AuthenticationProvider>(
            create: (_) => AuthenticationProvider(),
          ),
          ChangeNotifierProvider<EventCategoriesProvider>(
            create: (_) => EventCategoriesProvider(),
          ),
          ChangeNotifierProvider<DiscountCodesByEventProvider>(create: (_) {
            return DiscountCodesByEventProvider();
          }),
        ],
        child: MaterialApp.router(
          // showSemanticsDebugger: true,
          debugShowCheckedModeBanner: false,
          title: 'Passi',
          theme: darkTheme,
          routerConfig: AppRouter().router,
        ));
  }
}

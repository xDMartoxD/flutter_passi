import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:passi_app/providers/discount_code_provider.dart';
import 'package:passi_app/providers/authentication_provider.dart';
import 'package:passi_app/providers/event_categories_provider.dart';
import 'package:passi_app/providers/internet_provider.dart';
import 'package:passi_app/router/router.dart';
import 'package:passi_app/theme/theme_constants.dart';
import 'package:provider/provider.dart';

import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _configureAmplify();
  runApp(MyApp(conectivity: Connectivity()));
}

Future<void> _configureAmplify() async {
  try {
    // Create the API plugin.
    //
    // If `ModelProvider.instance` is not available, try running
    // `amplify codegen models` from the root of your project.
    final api = AmplifyAPI(modelProvider: ModelProvider.instance);
    final storage = AmplifyStorageS3();
    // Create the Auth plugin.
    final auth = AmplifyAuthCognito();
    final datastorePlugin =
        AmplifyDataStore(modelProvider: ModelProvider.instance);

    // Add the plugins and configure Amplify for your app.
    await Amplify.addPlugins([api, auth, storage, datastorePlugin]);
    await Amplify.configure(amplifyconfig);

    safePrint('Successfully configured');
  } on Exception catch (e) {
    safePrint('Error configuring Amplify: $e');
  }
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
      ),
    );
  }
}

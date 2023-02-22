import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:passi_app/providers/authentication_provider.dart';
import 'package:passi_app/providers/eventCategories.dart';
import 'package:passi_app/providers/internet.dart';
import 'package:passi_app/router/router.dart';
import 'package:passi_app/theme/theme_constants.dart';
import 'package:provider/provider.dart';

import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp(conectivity: Connectivity()));
}

class MyApp extends StatefulWidget {
  final Connectivity conectivity;
  const MyApp({super.key, required this.conectivity});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  Future<void> _configureAmplify() async {
    final authPlugin = AmplifyAuthCognito();
    final api = AmplifyAPI(modelProvider: ModelProvider.instance);
    final storage = AmplifyStorageS3();
    await Amplify.addPlugins([api, authPlugin, storage]);
    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      safePrint("Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Internet>(
          create: (context) => Internet(connectivity: widget.conectivity),
        ),
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (context) => AuthenticationProvider(),
        ),
        ChangeNotifierProvider<EventCategoriesProvider>(
          create: (context) => EventCategoriesProvider(),
        )
      ],
      child: MaterialApp.router(
        // showSemanticsDebugger: true,
        debugShowCheckedModeBanner: false,
        title: 'Passi',
        theme: dark_theme,
        routerConfig: AppRouter().router,
      ),
    );
  }
}

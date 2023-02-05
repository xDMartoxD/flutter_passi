import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:passi_app/providers/internet.dart';
import 'package:passi_app/router/router.dart';
import 'package:passi_app/theme/theme_constants.dart';
import 'package:provider/provider.dart';
import './amplifyconfiguration.dart' show amplifyconfig;

void main() {
  runApp(MyApp(conectivity: Connectivity()));
}

class MyApp extends StatefulWidget {
  final Connectivity conectivity;
  const MyApp({super.key, required this.conectivity});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _amplifyConfigured = false;

  @override
  void initState() {
    super.initState();
    configureAmplify();
  }

  void configureAmplify() async {
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;
    await Amplify.configure(amplifyconfig);
    try {
      setState(() {
        _amplifyConfigured = true;
      });
    } on Exception catch (e) {
      safePrint(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Internet>(
          create: (context) => Internet(connectivity: widget.conectivity),
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scan_app/providers/event_provider.dart';
import 'package:scan_app/screens/initial_screen.dart';

import 'environment/environment.dart';

void main() async {
  const String environment = String.fromEnvironment(
    'env',
    defaultValue: Environment.dev,
  );
  //this is where you set the environment
  Environment().initConfig(environment);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => EventState()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const EventSetter(),
    );
  }
}

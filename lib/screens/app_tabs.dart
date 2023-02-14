import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:passi_app/screens/home_screen.dart';
import 'package:passi_app/screens/profile_screen.dart';
import 'package:passi_app/screens/tickets_screen.dart';
import 'package:amplify_api/amplify_api.dart';
import '../amplifyconfiguration.dart';
import '../models/ModelProvider.dart';

class AppTabs extends StatefulWidget {
  static const route = "/";
  static const name = "tabs";
  const AppTabs({super.key});

  @override
  State<AppTabs> createState() => _AppTabsState();
}

class _AppTabsState extends State<AppTabs> with TickerProviderStateMixin {
  late final List<Map<String, Object?>> _screens;
  late int _currenPageIndex;
  late final TabController _tabController;
  @override
  void initState() {
    super.initState();
    _configureAmplify();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.index = 1;
    _currenPageIndex = 0;
    _screens = [
      {
        "title": "home",
        "screen": HomeScreen(),
        "appBarBottom": null,
        "appBarActions": [],
      },
      {
        "title": "Tickets",
        "screen": TicketsScreen(
          tabController: _tabController,
        ),
        "appBarBottom": TabBar(
          tabs: [
            Tab(text: "Pendientes"),
            Tab(text: "Proximas"),
            Tab(text: "Anteriores"),
          ],
          controller: _tabController,
        ),
        "appBarActions": []
      },
      {
        "title": "Perfil",
        "screen": ProfileScreen(),
        "appBarBottom": null,
        "appBarActions": [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      }
    ];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_currenPageIndex]["title"] as String),
        bottom: _screens[_currenPageIndex]["appBarBottom"] as PreferredSizeWidget?,
        actions: List<IconButton>.from(
          _screens[_currenPageIndex]["appBarActions"] as List<dynamic>,
        ),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.house),
            label: "Home",
          ),
          NavigationDestination(
            icon: FaIcon(FontAwesomeIcons.ticket),
            label: "Tickets",
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person,
              size: 28,
            ),
            label: "Profile",
          )
        ],
        selectedIndex: _currenPageIndex,
        onDestinationSelected: (value) => setState(() {
          _currenPageIndex = value;
        }),
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      ),
      body: _screens[_currenPageIndex]["screen"] as Widget,
    );
  }
}

Future<void> _configureAmplify() async {
  // Add any Amplify plugins you want to use
  final authPlugin = AmplifyAuthCognito();
  await Amplify.addPlugin(authPlugin);
  final api = AmplifyAPI(modelProvider: ModelProvider.instance);
  await Amplify.addPlugin(api);

  // You can use addPlugins if you are going to be adding multiple plugins
  // await Amplify.addPlugins([authPlugin, analyticsPlugin]);

  // Once Plugins are added, configure Amplify
  // Note: Amplify can only be configured once.
  try {
    await Amplify.configure(amplifyconfig);
  } on AmplifyAlreadyConfiguredException {
    safePrint("Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
  }
}

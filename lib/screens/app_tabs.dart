import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:passi_app/providers/authentication_provider.dart';

import 'package:passi_app/screens/home_screen.dart';
import 'package:passi_app/screens/profile_screen.dart';
import 'package:passi_app/screens/tickets_screen.dart';
import 'package:passi_app/screens/user_settings_screen.dart';
import 'package:passi_app/widgets/loading.dart';
import 'package:provider/provider.dart';

import '../amplifyconfiguration.dart';
import '../models/ModelProvider.dart';

class AppTabs extends StatefulWidget {
  static const path = "/";
  static const name = "tabs";
  const AppTabs({super.key});

  @override
  State<AppTabs> createState() => _AppTabsState();
}

class _AppTabsState extends State<AppTabs> with TickerProviderStateMixin {
  String _authStatus = 'Unknown';
  late final List<Map<String, Object?>> _screens;
  late int _currenPageIndex;
  late final TabController _tabController;
  bool _isAmplifyConfigured = false;
  Future<void> _configureAmplify() async {
    final authPlugin = AmplifyAuthCognito();
    final api = AmplifyAPI(modelProvider: ModelProvider.instance);
    final storage = AmplifyStorageS3();
    await Amplify.addPlugins([api, authPlugin, storage]);
    setState(() {
      _isAmplifyConfigured = true;
    });
    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      safePrint(
          "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
  }

  Future<void> initPlugin() async {
    final TrackingStatus status =
        await AppTrackingTransparency.trackingAuthorizationStatus;
    setState(() => _authStatus = '$status');
    // If the system can show an authorization request dialog
    if (status == TrackingStatus.notDetermined) {
      // Show a custom explainer dialog before the system dialog
      await showCustomTrackingDialog(context);
      // Wait for dialog popping animation
      await Future.delayed(const Duration(milliseconds: 200));
      // Request system's tracking authorization dialog
      final TrackingStatus status =
          await AppTrackingTransparency.requestTrackingAuthorization();
      setState(() => _authStatus = '$status');
    }

    final uuid = await AppTrackingTransparency.getAdvertisingIdentifier();
    print("UUID: $uuid");
  }

  Future<void> showCustomTrackingDialog(BuildContext context) async =>
      await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Dear User'),
          content: const Text(
            'We care about your privacy and data security. We keep this app free by showing ads. '
            'Can we continue to use your data to tailor ads for you?\n\nYou can change your choice anytime in the app settings. '
            'Our partners will collect data and use a unique identifier on your device to show you ads.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Continue'),
            ),
          ],
        ),
      );

  @override
  void initState() {
    super.initState();
    initPlugin();
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
            Tab(text: "Proximas"),
          ],
          controller: _tabController,
        ),
        "appBarActions": []
      },
      {
        "title": "Perfil",
        "screen": ProfileScreen(),
        "appBarBottom": null,
        "appBarActions": [
          IconButton(
            onPressed: () => {context.pushNamed(UserSettingsScreen.name)},
            icon: Icon(Icons.settings),
          )
        ],
      }
    ];

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (!Amplify.isConfigured) {
        await _configureAmplify();
      } else {
        setState(() {
          _isAmplifyConfigured = true;
        });
      }
      await Provider.of<AuthenticationProvider>(context, listen: false)
          .setUser();
    });
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
        bottom:
            _screens[_currenPageIndex]["appBarBottom"] as PreferredSizeWidget?,
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
              size: 32,
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
      body: _isAmplifyConfigured
          ? _screens[_currenPageIndex]["screen"] as Widget
          : Loading(),
    );
  }
}

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:passi_app/providers/authentication_provider.dart';
import 'package:passi_app/screens/home_screen.dart';
import 'package:passi_app/screens/profile_screen.dart';
import 'package:passi_app/screens/tickets_screen.dart';
import 'package:passi_app/screens/user_settings_screen.dart';
import 'package:provider/provider.dart';

class AppTabs extends StatefulWidget {
  static const path = "/";
  static const name = "tabs";
  const AppTabs({super.key});

  @override
  State<AppTabs> createState() => _AppTabsState();
}

class _AppTabsState extends State<AppTabs> with TickerProviderStateMixin {
  late final List<Map<String, Object?>> _screens;
  late int _currenPageIndex;
  // late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    // _tabController = TabController(length: 3, vsync: this);
    // _tabController.index = 1;
    initPlugin();
    _currenPageIndex = 0;

    _screens = [
      {
        "title": "Home",
        "screen": const HomeScreen(),
        "appBarBottom": null,
        "appBarActions": [],
      },
      {
        "title": "Tickets",
        "screen": const TicketsScreen(),
        "appBarBottom": null
        // TabBar(
        //   tabs: [
        //     Tab(text: "Pendientes"),
        //     Tab(text: "Proximas"),
        //     Tab(text: "Anteriores"),
        //   ],
        //   controller: _tabController,
        // )
        ,
        "appBarActions": []
      },
      {
        "title": "Perfil",
        "screen": const ProfileScreen(),
        "appBarBottom": null,
        "appBarActions": [
          IconButton(
            onPressed: () => {context.pushNamed(UserSettingsScreen.name)},
            icon: const Icon(Icons.settings),
          )
        ],
      }
    ];

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (context.mounted) {
        await Provider.of<AuthenticationProvider>(context, listen: false)
            .setUser();
      }
    });
  }

  Future<void> initPlugin() async {
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;
    print(status.name);
    // If the system can show an authorization request dialog
    if (status == TrackingStatus.notDetermined) {
      // Show a custom explainer dialog before the system dialog
      await showCustomTrackingDialog(context);
      // Wait for dialog popping animation
      await Future.delayed(const Duration(milliseconds: 200));
      // Request system's tracking authorization dialog
    }

    final uuid = await AppTrackingTransparency.getAdvertisingIdentifier();
    safePrint("UUID: $uuid");
  }

  Future<void> showCustomTrackingDialog(BuildContext context) async =>
      await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Querido Usuario'),
          content: const Text(
            'Nos preocupamos por su privacidad y la seguridad de sus datos. Mantenemos esta aplicación gratuita al mostrar anuncios. '
            '¿Podemos seguir usando sus datos para personalizar los anuncios para usted?\n\nPuede cambiar su elección en cualquier momento en la configuración de la aplicación. '
            "Nuestros socios recopilarán datos y utilizarán un identificador único en su dispositivo para mostrarle anuncios.",
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
  void dispose() {
    // _tabController.dispose();
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
      ),
      body: _screens[_currenPageIndex]["screen"] as Widget,
    );
  }
}

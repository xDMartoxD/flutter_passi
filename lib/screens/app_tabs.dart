import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:passi_app/screens/home_screen.dart';

class AppTabs extends StatefulWidget {
  static const route = "/";
  static const name = "tabs";
  const AppTabs({super.key});

  @override
  State<AppTabs> createState() => _AppTabsState();
}

class _AppTabsState extends State<AppTabs> {
  late final List<Map<String, Object>> _screens;
  late int _currenPageIndex;
  @override
  void initState() {
    super.initState();
    _currenPageIndex = 0;
    _screens = [
      {
        "title": "home",
        "screen": HomeScreen(),
        "navBarColor": Color.fromRGBO(33, 33, 33, 1),
        "elevation": 5.0
      },
      {
        "title": "Tickets",
        "screen": HomeScreen(),
        "navBarColor": Colors.transparent,
        "elevation": 0.0
      },
      {
        "title": "Perfil",
        "screen": HomeScreen(),
        "navBarColor": Colors.transparent,
        "elevation": 0.0
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_screens[_currenPageIndex]["title"] as String),
          backgroundColor: _screens[_currenPageIndex]["navBarColor"] as Color,
          elevation: _screens[_currenPageIndex]["elevation"] as double,
        ),
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(
              icon: FaIcon(FontAwesomeIcons.house),
              label: "Home",
            ),
            NavigationDestination(
              icon: FaIcon(FontAwesomeIcons.ticket),
              label: "Calenda",
            ),
            NavigationDestination(
              icon: FaIcon(FontAwesomeIcons.ticket),
              label: "Calendar",
            )
          ],
          selectedIndex: _currenPageIndex,
          onDestinationSelected: (value) => setState(() {
            _currenPageIndex = value;
          }),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        ),
        body: _screens[_currenPageIndex]["screen"] as Widget);
  }
}

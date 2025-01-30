import 'package:flutter/material.dart';
import 'package:pms_flutter/screens/dashboard/dashboard.dart';
import 'package:pms_flutter/screens/home/home.dart';
import 'package:pms_flutter/screens/notifications/notifications.dart';
import 'package:pms_flutter/screens/profile/profile.dart';
import 'package:pms_flutter/screens/settings/settings.dart';

/// Flutter code sample for [NavigationBar].


class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentPageIndex = 0;

  List screens = [
    MyHomePage(title: "PMS"),
    NotificationsPage(),
    DashboardPage(),
    SettingsPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.notifications_sharp),
            icon: Badge(child: Icon(Icons.notifications_none)),
            label: 'Notifications',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.dashboard),
            icon: Icon(Icons.dashboard_outlined),
            label: 'Dashboard',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outlined),
            label: 'Profile',
          ),
        ],
      ),
      body: screens[currentPageIndex],
    );
  }
}

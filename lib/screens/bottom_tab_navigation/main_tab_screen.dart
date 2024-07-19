import 'package:flutter/material.dart';
import 'package:social/screens/bottom_tab_navigation/offers_screen.dart';

import 'homepage_screen.dart';
import 'profile_screen.dart';
import 'shop_screen.dart';

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  int _currentIndex = 0;

  List<Widget> navigationScreens = const [
    Homepage(),
    OffersScreen(),
    ProfileScreen(),
    ShopScreen()
  ];

  void tabHandler(int value) {
    setState(() {
      _currentIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: tabHandler,
        destinations: const [
          NavigationDestination(
            tooltip: "Home",
            selectedIcon: Icon(Icons.home_filled),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            
            tooltip: "Insights",
            selectedIcon: Icon(Icons.insights),
            icon: Icon(Icons.insights_outlined),
            label: 'Insights',
          ),
          NavigationDestination(
            tooltip: "Notifications",
            selectedIcon: Icon(Icons.notifications),
            icon: Icon(Icons.notifications_none_rounded),
            label: 'Notifications',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.business_center),
            icon: Icon(Icons.business_center_outlined),
            label: 'Shop',
            tooltip: "Shop",
          ),
        ],
      ),
      body: navigationScreens[_currentIndex],
    );
  }
}

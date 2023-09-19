import 'package:flutter/material.dart';
import 'package:flutter_weather_project/screens/Details/details_screen.dart';

import '../screens/Home/home_screen.dart';
import '../screens/Search/search_screen.dart';

enum TabItem { home, search, details }

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  TabItem _selectedTab = TabItem.home;

  final Map<TabItem, Widget> _screens = {
    TabItem.home: const HomeScreen(),
    TabItem.search: SearchScreen(),
    TabItem.details: const DetailsScreen(
      city: 'Riyadh',
    ),
  };

  final Map<TabItem, BottomNavigationBarItem> _items = {
    TabItem.home: const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    TabItem.search: const BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Search',
    ),
  };

  void _onTabSelected(TabItem tab) {
    setState(() {
      _selectedTab = tab;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedTab],
      bottomNavigationBar: BottomNavigationBar(
        items: _items.values.toList(),
        currentIndex: TabItem.values.indexOf(_selectedTab),
        onTap: (index) => _onTabSelected(TabItem.values[index]),
      ),
    );
  }
}

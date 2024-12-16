import 'package:flutter/material.dart';
import 'package:weather_app_dioriver/constants/app_colors.dart';
import 'package:weather_app_dioriver/screens/search_screen.dart';
import 'package:weather_app_dioriver/screens/weather_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;
  final _destinations = const [
      NavigationDestination(icon:  Icon(Icons.home_outlined),
      selectedIcon: Icon(Icons.home_filled), label: ''),

      NavigationDestination(icon: Icon(Icons.search_outlined),
      selectedIcon: Icon(Icons.search), label: ''),

      NavigationDestination(icon: Icon(Icons.wb_sunny_outlined),
      selectedIcon: Icon(Icons.wb_sunny), label: ''),

      NavigationDestination(icon: Icon(Icons.settings_outlined),
      selectedIcon: Icon(Icons.settings), label: ''),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const WeatherScreen(),
        const SearchScreen(),
        const Center(child: Text('Weather Screen')),
        const Center(child: Text('Settings Screen')),
      ][_currentPageIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          iconTheme: WidgetStatePropertyAll(IconThemeData(color: AppColors.white))),
        child: NavigationBar(
          backgroundColor: AppColors.secondaryBlack,
          destinations: _destinations,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: _currentPageIndex,
          indicatorColor: Colors.transparent,
          onDestinationSelected: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
        ),
      )
    );
  }
}
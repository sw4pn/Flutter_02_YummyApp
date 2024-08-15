import 'package:flutter/material.dart';

import 'components/theme_button.dart';
import 'components/color_button.dart';

import 'constants.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.changeTheme,
    required this.changeColor,
    required this.colorSelected,
    required this.appTitle,
  });

  final void Function(bool useLightMode) changeTheme;
  final void Function(int value) changeColor;
  final ColorSelection colorSelected;
  final String appTitle;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tab = 0;

  List<NavigationDestination> appBarDestinations = const [
    NavigationDestination(
      icon: Icon(Icons.home_outlined),
      label: 'Explore',
      selectedIcon: Icon(Icons.home),
    ),
    NavigationDestination(
      icon: Icon(Icons.list_outlined),
      label: 'Orders',
      selectedIcon: Icon(Icons.list),
    ),
    NavigationDestination(
      icon: Icon(Icons.person_2_outlined),
      label: 'Account',
      selectedIcon: Icon(Icons.person),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final pages = [
      // TODO: Replace with ExplorePage
      const Center(
        child: Text(
          'Explore Page',
          style: TextStyle(fontSize: 32.0),
        ),
      ),
      const Center(
        child: Text(
          'Order Page',
          style: TextStyle(fontSize: 32.0),
        ),
      ),
      const Center(
        child: Text(
          'Account Page',
          style: TextStyle(fontSize: 32.0),
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        title: Text(widget.appTitle),
        backgroundColor: Theme.of(context).colorScheme.surface,
        actions: [
          ThemeButton(changeThemeMode: widget.changeTheme),
          ColorButton(
              changeColor: widget.changeColor,
              colorSelected: widget.colorSelected)
        ],
      ),
      body: IndexedStack(
        index: tab,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
          selectedIndex: tab,
          onDestinationSelected: (index) {
            setState(() {
              tab = index;
            });
          },
          destinations: appBarDestinations),
    );
  }
}

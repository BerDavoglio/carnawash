import 'package:flutter/material.dart';

NavigationBar navigationBarComponent(BuildContext context) {
  return NavigationBar(
    destinations: const <Widget>[
      NavigationDestination(
        selectedIcon: Icon(
          Icons.home_outlined,
          color: Colors.blue,
        ),
        icon: Icon(Icons.home_outlined),
        label: 'Home',
      ),
      NavigationDestination(
        selectedIcon: Icon(
          Icons.calendar_month_outlined,
          color: Colors.blue,
        ),
        icon: Icon(Icons.calendar_month_outlined),
        label: 'Schedules',
      ),
      NavigationDestination(
        selectedIcon: Icon(
          Icons.timer_outlined,
          color: Colors.blue,
        ),
        icon: Icon(Icons.timer_outlined),
        label: 'History',
      ),
      NavigationDestination(
        selectedIcon: Icon(
          Icons.help_outline,
          color: Colors.blue,
        ),
        icon: Icon(Icons.help_outline),
        label: 'Help',
      ),
      NavigationDestination(
        selectedIcon: Icon(
          Icons.person_outline,
          color: Colors.blue,
        ),
        icon: Icon(Icons.person_outline),
        label: 'Profile',
      ),
    ],
  );
}

import 'package:app_client/ui/ui.dart';
import 'package:flutter/material.dart';

NavigationBar navigationBarComponent(BuildContext context) {
  return NavigationBar(
    indicatorColor: Colors.grey[200],
    onDestinationSelected: (int index) {
      switch (index) {
        case 0:
          Navigator.of(context).pushNamed(AppRoutes.HOME);
          break;
        case 1:
          Navigator.of(context).pushNamed(AppRoutes.SCHEDULES);
          break;
        case 2:
          Navigator.of(context).pushNamed(AppRoutes.HISTORY);
          break;
        case 3:
          Navigator.of(context).pushNamed(AppRoutes.HELP);
          break;
        case 4:
          Navigator.of(context).pushNamed(AppRoutes.PERFIL);
          break;
      }
    },
    destinations: const <Widget>[
      NavigationDestination(
        icon: Icon(Icons.home_outlined),
        label: 'Home',
      ),
      NavigationDestination(
        icon: Icon(Icons.calendar_month_outlined),
        label: 'Schedules',
      ),
      NavigationDestination(
        icon: Icon(Icons.timer_outlined),
        label: 'History',
      ),
      NavigationDestination(
        icon: Icon(Icons.help_outline),
        label: 'Help',
      ),
      NavigationDestination(
        icon: Icon(Icons.person_outline),
        label: 'Profile',
      ),
    ],
  );
}

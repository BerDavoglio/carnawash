import 'package:flutter/material.dart';

import '../ui.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CarWash',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        AppRoutes.HOME: (_) => const VehiclesEditPage(),
        AppRoutes.LOGIN: (_) => const LoginPage(),
        AppRoutes.SCHEDULE: (_) => const SchedulePage(),
        AppRoutes.SCHEDULES: (_) => const SchedulesPage(),
        AppRoutes.RATING: (_) => const RatingPage(),
        AppRoutes.HISTORY: (_) => const HistoryPage(),
        AppRoutes.HELP: (_) => const HelpPage(),
        AppRoutes.PERFIL: (_) => const PerfilPage(),
        AppRoutes.ACCOUNT: (_) => const AccountPage(),
        AppRoutes.VEHICLES: (_) => const VehiclesPage(),
        AppRoutes.VEHICLES_EDIT: (_) => const VehiclesEditPage(),
      },
    );
  }
}

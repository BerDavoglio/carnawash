import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../infra/infra.dart';
import '../ui.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CarWash',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          AppRoutes.HOME: (_) => const HomePage(),
          AppRoutes.FIRST_LOGIN_HOME: (_) => const FirstLoginHomePage(),
          AppRoutes.LOGIN: (_) => const LoginPage(),
          AppRoutes.SCHEDULES: (_) => const SchedulesPage(),
          AppRoutes.SUPPLY: (_) => const SupplyPage(),
          AppRoutes.PAYMENTS: (_) => const PaymentsPage(),
          AppRoutes.HELP: (_) => const HelpPage(),
          AppRoutes.HELP_CHAT: (_) => const HelpChatPage(),
          AppRoutes.PERFIL: (_) => const PerfilPage(),
          AppRoutes.ACCOUNT: (_) => const AccountPage(),
          AppRoutes.WALLET: (_) => const WalletPage(),
          AppRoutes.LANGUAGE: (_) => const LanguagePage(),
          AppRoutes.NOTIFICATION_CONFIG: (_) => const NotificationConfigPage(),
          AppRoutes.NOTIFICATION: (_) => const NotificationPage(),
          AppRoutes.TERMS: (_) => const TermsConditionsPage(),
          AppRoutes.AVAILABILITY: (_) => const AvailabilityPage(),
          AppRoutes.WASH_REQUEST: (_) => const WashRequestPage(),
        },
      ),
    );
  }
}

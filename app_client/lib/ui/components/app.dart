import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../infra/infra.dart';
import '../ui.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FAQProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NotificationProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ScheduleProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => VehiclesProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => WalletProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => RegularWashProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ServicesProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CarnaWash',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          AppRoutes.HOME: (_) => const AuthOrHomeScreen(),
          AppRoutes.LOGIN: (_) => const LoginPage(),
          AppRoutes.SCHEDULES: (_) => const SchedulesPage(),
          AppRoutes.SUBSCRIPTION: (_) => const SubscriptionPage(),
          AppRoutes.RATING: (_) => const RatingPage(),
          AppRoutes.HISTORY: (_) => const HistoryPage(),
          AppRoutes.HELP: (_) => const HelpPage(),
          AppRoutes.HELP_CHAT: (_) => const HelpChatPage(),
          AppRoutes.PERFIL: (_) => const PerfilPage(),
          AppRoutes.ACCOUNT: (_) => const AccountPage(),
          AppRoutes.VEHICLES: (_) => const VehiclesPage(),
          AppRoutes.WALLET: (_) => const WalletPage(),
          AppRoutes.LANGUAGE: (_) => const LanguagePage(),
          AppRoutes.NOTIFICATION_CONFIG: (_) => const NotificationConfigPage(),
          AppRoutes.FAQ: (_) => const FAQPage(),
          AppRoutes.NOTIFICATION: (_) => const NotificationPage(),
          AppRoutes.TERMS: (_) => const TermsConditionsPage(),
        },
      ),
    );
  }
}

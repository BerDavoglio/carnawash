import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import '../../../infra/infra.dart';
import './pages.dart';

class AuthOrHomeScreen extends StatelessWidget {
  const AuthOrHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider loginProvider = Provider.of(context);

    return FutureBuilder(
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.error != null) {
          return const Center(child: Text('Ocorreu um erro!'));
        } else {
          return loginProvider.isAuth ? const HomePage() : const LoginPage();
        }
      },
      future: null,
    );
  }
}

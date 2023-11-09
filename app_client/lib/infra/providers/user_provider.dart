import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../ui/ui.dart';

class UserProvider with ChangeNotifier {
  String _token = '';

  String get token => _token;

  bool get isAuth {
    return _token != '';
  }

  Future<void> submitLogin(
      BuildContext context, String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('${Constants.BACKEND_BASE_URL}/jwt/'),
        body: {
          "email": email,
          "password": password,
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _token = v['token'];
        Navigator.of(context).pushNamed(AppRoutes.HOME);
      } else {
        // Login Inválido
        await showDialog<void>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Erro!'),
            content: Text(v['errors'][0]),
            actions: [
              TextButton(
                child: const Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      }

      Navigator.of(context).pushNamed(AppRoutes.HOME);

      notifyListeners();
    } catch (e) {
      print(e);
      await showDialog<void>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Provider Error! SubmitLogin'),
          content: Text(e.toString()),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }

  Future<void> submitCreate(BuildContext context, String email, String password,
      String name, String gender) async {
    try {
      final response = await http.post(
        Uri.parse('${Constants.BACKEND_BASE_URL}/users/'),
        body: {
          "email": email,
          "password": password,
          "name": name,
          "gender": gender,
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Account Created! Verify your email!'),
            action: SnackBarAction(
              label: 'Okay',
              onPressed: () {},
            ),
          ),
        );
      } else if (v['errors'] != '') {
        // Login Inválido
        await showDialog<void>(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Erro!'),
            content: Text(v['errors']),
            actions: [
              TextButton(
                child: const Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      }

      Navigator.of(context).pushNamed(AppRoutes.HOME);

      notifyListeners();
    } catch (e) {
      await showDialog<void>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Provider Error! SubmitCreate'),
          content: Text(e.toString()),
          actions: [
            TextButton(
              child: const Text('Ok'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      );
    }
  }

  void logout() {
    _token = '';
    notifyListeners();
  }
}

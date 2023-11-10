// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../../data/data.dart';
import '../../ui/ui.dart';
import '../infra.dart';

class UserProvider with ChangeNotifier {
  String _token = '';
  late UserCompleteModel _perfil;

  String get token => _token;
  UserCompleteModel get perfil => _perfil;

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
        await loadPerfil(context);
        Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
        notifyListeners();
      } else {
        await comumDialog(
          context,
          'Error',
          v['errors'],
        );
      }

      Navigator.of(context).pushNamed(AppRoutes.HOME);

      notifyListeners();
    } catch (e) {
      await comumDialog(
        context,
        'Provider Error! SubmitLogin',
        e.toString(),
      );
    }
  }

  Future<void> signIn(BuildContext context, UserSignModel user) async {
    try {
      final response = await http.post(
        Uri.parse('${Constants.BACKEND_BASE_URL}/users/'),
        body: {
          "email": user.email,
          "password": user.password,
          "name": user.name,
          "phone": user.phone,
          "address": user.address,
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
        await comumDialog(
          context,
          'Error',
          v['errors'],
        );
      }

      Navigator.of(context).pushNamed(AppRoutes.HOME);

      notifyListeners();
    } catch (e) {
      await comumDialog(
        context,
        'Provider Error! SignIn',
        e.toString(),
      );
    }
  }

  Future<void> loadPerfil(BuildContext context) async {
    try {
      final response = await http.get(
        Uri.parse('${Constants.BACKEND_BASE_URL}/user/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $_token',
        },
      );

      if (response.statusCode == 200) {
        _perfil = jsonDecode(response.body);
        notifyListeners();
      } else if (jsonDecode(response.body)['errors'] != '') {
        await comumDialog(
          context,
          'Erro!',
          jsonDecode(response.body)['errors'],
        );
      }
    } catch (e) {
      await comumDialog(
        context,
        'Provider Error!',
        'Ocorreu um erro ao tentar obter os valores de perfil. $e',
      );
    }
  }

  Future<void> updatePerfil(
      BuildContext context, UserCompleteModel newUser) async {
    try {
      final response = await http.put(
        Uri.parse('${Constants.BACKEND_BASE_URL}/user/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $_token',
        },
        body: jsonEncode(newUser),
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        await comumDialog(
          context,
          'Usuário Atualizado',
          'Usuário atualizado com Sucesso!',
        );
        await loadPerfil(context);
        Navigator.of(context).pop();
        notifyListeners();
      } else if (v['errors'] != '') {
        await comumDialog(
          context,
          'Erro!',
          v['errors'],
        );
      }
    } catch (e) {
      await comumDialog(
        context,
        'Provider Error!',
        e.toString(),
      );
    }
  }

  void logout() {
    _token = '';
    notifyListeners();
  }
}

// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _token = v['token'];
        await loadPerfil(context);
        Navigator.of(context).pushReplacementNamed(AppRoutes.HOME);
      } else {
        await comumDialog(
          context,
          'Error',
          v['errors'],
        );
      }

      Navigator.of(context).pushNamed(AppRoutes.HOME);
    } catch (e) {
      await comumDialog(
        context,
        'Provider Error! SubmitLogin',
        e.toString(),
      );
    }
  }

  Future<void> signIn(
    BuildContext context,
    UserSignModel user,
    CarModel car,
  ) async {
    try {
      VehiclesProvider vehiclesProvider = Provider.of(context, listen: false);

      final response = await http.post(
        Uri.parse('${Constants.BACKEND_BASE_URL}/users/'),
        body: jsonEncode({
          "email": user.email,
          "password": user.password,
          "name": user.name,
          "phone": user.phone,
          "address": user.address,
        }),
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _token = v[1];
        await vehiclesProvider.createCar(
          context,
          car,
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Account Created! Verify your email!'),
            action: SnackBarAction(
              label: 'Okay',
              onPressed: () {},
            ),
          ),
        );
        Navigator.of(context).pushReplacementNamed(AppRoutes.LOGIN);
      } else if (v['errors'] != '') {
        await comumDialog(
          context,
          'Error',
          v['errors'],
        );
      }

      Navigator.of(context).pushNamed(AppRoutes.HOME);
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
        Uri.parse('${Constants.BACKEND_BASE_URL}/users/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $_token',
        },
      );

      var v = jsonDecode(response.body);
      print(v);

      if (response.statusCode == 200) {
        _perfil = UserCompleteModel(
          id: v['id'],
          name: v['name'],
          email: v['email'],
          phone: v['phone'],
          address: v['address'],
        );
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
        'Ocorreu um erro ao tentar obter os valores de perfil. $e',
      );
    }
  }

  Future<void> updatePerfil(
      BuildContext context, UserCompleteModel newUser) async {
    try {
      final response = await http.put(
        Uri.parse('${Constants.BACKEND_BASE_URL}/users/'),
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

  Future<void> regularWash(
    BuildContext context,
    DateTime init_date,
    int date_to_date,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('${Constants.BACKEND_BASE_URL}/users/regular/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $_token',
        },
        body: jsonEncode({
          'init_date': init_date,
          'date_to_date': date_to_date,
        }),
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Regular wash created with success!'),
            action: SnackBarAction(
              label: 'Okay',
              onPressed: () {},
            ),
          ),
        );
      } else {
        await comumDialog(
          context,
          'Error',
          v['errors'],
        );
      }

      Navigator.of(context).pushNamed(AppRoutes.HOME);
    } catch (e) {
      await comumDialog(
        context,
        'Provider Error! SubmitLogin',
        e.toString(),
      );
    }
  }

  Future<void> referFriends(
    BuildContext context,
    String listFriends,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('${Constants.BACKEND_BASE_URL}/users/refer/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $_token',
        },
        body: jsonEncode({
          "emails": listFriends,
        }),
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
                'Refer to friends work with success! Check your e-mail!'),
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
    } catch (e) {
      await comumDialog(
        context,
        'Provider Error! Refer to Friends',
        e.toString(),
      );
    }
  }

  void logout() {
    _token = '';
  }
}

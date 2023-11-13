// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/data.dart';
import '../../ui/ui.dart';
import '../infra.dart';

class NotificationProvider with ChangeNotifier {
  late List<GeralNotificationModel> _geralNotifications;
  late List<UserNotificationModel> _notifications;

  List<GeralNotificationModel> get geralNotifications => _geralNotifications;
  List<UserNotificationModel> get notifications => _notifications;

  Future<void> loadNotifications(BuildContext context) async {
    final UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse('${Constants.BACKEND_BASE_URL}/notification/sent/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userProvider.token}',
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _notifications = v;
        await loadGeralNotifications(context);
        notifyListeners();
      } else if (v['errors'] != '') {
        await comumDialog(
          context,
          'Error',
          v['errors'],
        );
      }
      notifyListeners();
    } catch (e) {
      await comumDialog(
        context,
        'Provider Error! GetNotifications',
        e.toString(),
      );
    }
  }

  Future<void> loadGeralNotifications(BuildContext context) async {
    final UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse('${Constants.BACKEND_BASE_URL}/notification/user/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userProvider.token}',
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _geralNotifications = v;
        notifyListeners();
      } else if (v['errors'] != '') {
        await comumDialog(
          context,
          'Error',
          v['errors'],
        );
      }
      notifyListeners();
    } catch (e) {
      await comumDialog(
        context,
        'Provider Error! GetNotifications',
        e.toString(),
      );
    }
  }
}

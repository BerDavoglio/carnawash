// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/data.dart';
import '../../ui/ui.dart';
import '../infra.dart';

class RegularwashProvider with ChangeNotifier {
  late List<SubscriptionBoxModel> _regularWashList;

  List<SubscriptionBoxModel> get regularWashList => _regularWashList;

  Future<void> loadRegular(BuildContext context) async {
    final UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse('${Constants.BACKEND_BASE_URL}/services/regular/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userProvider.token}',
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _regularWashList = v;

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
        'Provider Error! loadRegularwash',
        e.toString(),
      );
    }
  }
}

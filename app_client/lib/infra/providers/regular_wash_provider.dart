// ignore_for_file: use_build_context_synchronously, prefer_final_fields

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/data.dart';
import '../../ui/ui.dart';
import '../infra.dart';

class RegularwashProvider with ChangeNotifier {
  List<SubscriptionBoxModel> _regularWashList = [];

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
        for (Map i in v) {
          _regularWashList.add(SubscriptionBoxModel(
            car_size: i['car_size'],
            price: i['price'],
            additional_services: i['additional_services'],
          ));
        }
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

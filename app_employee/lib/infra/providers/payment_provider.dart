// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/data.dart';
import '../../ui/ui.dart';
import '../infra.dart';

class PaymentProvider with ChangeNotifier {
  List<PaymentModel> _listPayment = [];
  List<PaymentModel> get listPayment => _listPayment;

  Future<void> loadHistory(
    BuildContext context,
    DateTime initialDate,
    DateTime endDate,
  ) async {
    UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse(
            '${Constants.BACKEND_BASE_URL}/payment/washer/pay-washer/$initialDate/$endDate/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userProvider.token}',
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        for (Map i in v) {
          _listPayment.add(
            PaymentModel(
              id: i['id'],
              washer_id: i['washer_id'],
              wash_date: i['wash_date'],
              pay_data: i['pay_data'],
              wash_id: i['wash_id'],
            ),
          );
        }
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
        'Provider Error! loadHistory',
        e.toString(),
      );
    }
  }

  Future<CarModel?> loadCar(BuildContext context, int id) async {
    UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse('${Constants.BACKEND_BASE_URL}/cars/washer/$id/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userProvider.token}',
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        await loadCarSizes(context);
        return v;
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
        'Provider Error! loadCar',
        e.toString(),
      );
    }
    return null;
  }

  Future<List<CarsizeModel>?> loadCarSizes(BuildContext context) async {
    UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse('${Constants.BACKEND_BASE_URL}/services/size/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userProvider.token}',
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return v;
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
        'Provider Error! loadCarSizes',
        e.toString(),
      );
    }
    return null;
  }
}

// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/data.dart';
import '../../ui/ui.dart';
import '../infra.dart';

class ScheduleProvider with ChangeNotifier {
  late ScheduleModel _selectedSchedule;
  late List<ScheduleModel> _listSchedules;

  ScheduleModel get selectedSchedule => _selectedSchedule;
  List<ScheduleModel> get listSchedules => _listSchedules;

  Future<void> loadSchedules(
    BuildContext context,
  ) async {
    UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse('${Constants.BACKEND_BASE_URL}/schedule/client/all/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userProvider.token}',
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _listSchedules = v;
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
        'Provider Error! loadSchedules',
        e.toString(),
      );
    }
  }

  Future<ScheduleModel?> loadOneSchedules(BuildContext context, int id) async {
    UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse('${Constants.BACKEND_BASE_URL}/schedule/client/$id'),
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
        return null;
      }
    } catch (e) {
      await comumDialog(
        context,
        'Provider Error! loadOneSchedule',
        e.toString(),
      );
      return null;
    }
    return null;
  }

  Future<void> createSchedule(
    BuildContext context,
    ScheduleModel schedule,
  ) async {
    UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.post(
        Uri.parse('${Constants.BACKEND_BASE_URL}/schedule/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userProvider.token}',
        },
        body: jsonEncode({
          'cars_list_id': schedule.cars_list_id,
          'selected_date': schedule.selected_date,
          'address': schedule.address,
          'observation_address': schedule.observation_address,
          'coupon_id': schedule.coupon_id,
          'credit_card_id': schedule.credit_card_id,
          'three': schedule.three,
        }),
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
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
        'Provider Error! createSchedule',
        e.toString(),
      );
    }
  }

  Future<void> cancelSchedule(BuildContext context, int id) async {
    UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.put(
        Uri.parse('${Constants.BACKEND_BASE_URL}/schedule/cancel/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userProvider.token}',
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text(
              'Schedule cancelled with success!',
            ),
            action: SnackBarAction(
              label: 'Okay',
              onPressed: () {},
            ),
          ),
        );
        await loadSchedules(context);
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
        'Provider Error! cancelSchedule',
        e.toString(),
      );
    }
  }

  Future<void> rateSchedule(
    BuildContext context,
    int id,
    double rate,
  ) async {
    UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.put(
        Uri.parse('${Constants.BACKEND_BASE_URL}/schedule/rate/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userProvider.token}',
        },
        body: jsonEncode({
          'rate': rate,
        }),
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        await loadSchedules(context);
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
        'Provider Error! rateSchedule',
        e.toString(),
      );
    }
  }
}

// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../data/data.dart';
import '../../ui/ui.dart';
import '../infra.dart';

class ScheduleProvider with ChangeNotifier {
  late ScheduleModel _selectedSchedule;
  final List<ScheduleModel> _listSchedules = [];
  final List<ScheduleModel> _listHistorySchedules = [];
  final List<ScheduleModel> _listByDate = [];

  ScheduleModel get selectedSchedule => _selectedSchedule;
  List<ScheduleModel> get listSchedules => _listSchedules;
  List<ScheduleModel> get listHistorySchedules => _listHistorySchedules;
  List<ScheduleModel> get listByDate => _listByDate;

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
        for (Map i in v) {
          _listSchedules.add(ScheduleModel(
            id: i['id'],
            user_id: i['user_id'],
            cars_list_id: i['cars_list_id'],
            selected_date: i['selected_date'],
            address: i['address'],
            observation_address: i['observation_address'],
            coupon_id: i['coupon_id'],
            payment_schedule_id: i['payment_schedule_id'],
            status: i['status'],
            washer_id: i['washer_id'],
            rate: i['rate'],
          ));
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
        'Provider Error! loadSchedules',
        e.toString(),
      );
    }
  }

  Future<void> loadDate(BuildContext context, DateTime date) async {
    UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse(
            '${Constants.BACKEND_BASE_URL}/schedule/client/by-date/${DateFormat('yyyy-MM-dd').format(date)}'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userProvider.token}',
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        for (Map i in v) {
          _listByDate.add(ScheduleModel(
            id: i['id'],
            user_id: i['user_id'],
            cars_list_id: i['cars_list_id'],
            selected_date: i['selected_date'],
            address: i['address'],
            observation_address: i['observation_address'],
            coupon_id: i['coupon_id'],
            payment_schedule_id: i['payment_schedule_id'],
            status: i['status'],
            washer_id: i['washer_id'],
            rate: i['rate'],
          ));
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
        'Provider Error! loadSchedules',
        e.toString(),
      );
    }
  }

  Future<void> loadHistory(
      BuildContext context, DateTime initialDate, DateTime endDate) async {
    UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse(
            '${Constants.BACKEND_BASE_URL}/schedule/client/history/$initialDate/$endDate/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userProvider.token}',
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        for (Map i in v) {
          _listHistorySchedules.add(ScheduleModel(
            id: i['id'],
            user_id: i['user_id'],
            cars_list_id: i['cars_list_id'],
            selected_date: i['selected_date'],
            address: i['address'],
            observation_address: i['observation_address'],
            coupon_id: i['coupon_id'],
            payment_schedule_id: i['payment_schedule_id'],
            status: i['status'],
            washer_id: i['washer_id'],
            rate: i['rate'],
          ));
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

  Future<ScheduleModel?> loadOneSchedules(BuildContext context, int id) async {
    UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse('${Constants.BACKEND_BASE_URL}/schedule/client/by-id/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userProvider.token}',
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return ScheduleModel(
          id: v['id'],
          user_id: v['user_id'],
          cars_list_id: v['cars_list_id'],
          selected_date: v['selected_date'],
          address: v['address'],
          observation_address: v['observation_address'],
          coupon_id: v['coupon_id'],
          payment_schedule_id: v['payment_schedule_id'],
          status: v['status'],
          washer_id: v['washer_id'],
          rate: v['rate'],
        );
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

  Future<ScheduleModel?> loadRebookSchedule(BuildContext context) async {
    UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse('${Constants.BACKEND_BASE_URL}/schedule/client/rebook/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userProvider.token}',
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return ScheduleModel(
          id: v['id'],
          user_id: v['user_id'],
          cars_list_id: v['cars_list_id'],
          selected_date: v['selected_date'],
          address: v['address'],
          observation_address: v['observation_address'],
          coupon_id: v['coupon_id'],
          payment_schedule_id: v['payment_schedule_id'],
          status: v['status'],
          washer_id: v['washer_id'],
          rate: v['rate'],
        );
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

  Future<ScheduleModel?> loadOngoingSchedule(BuildContext context) async {
    UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse('${Constants.BACKEND_BASE_URL}/schedule/client/ongoing/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userProvider.token}',
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return ScheduleModel(
          id: v['id'],
          user_id: v['user_id'],
          cars_list_id: v['cars_list_id'],
          selected_date: v['selected_date'],
          address: v['address'],
          observation_address: v['observation_address'],
          coupon_id: v['coupon_id'],
          payment_schedule_id: v['payment_schedule_id'],
          status: v['status'],
          washer_id: v['washer_id'],
          rate: v['rate'],
        );
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
    CreateScheduleModel schedule,
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
          'cars_obj_list': schedule.cars_obj_list,
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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Schedule Created!'),
            action: SnackBarAction(
              label: 'Okay',
              onPressed: () {},
            ),
          ),
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

  Future<double?> loadPrice(
    BuildContext context,
    int id,
  ) async {
    UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse('${Constants.BACKEND_BASE_URL}/schedule/value/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userProvider.token}',
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return v['price'];
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
        'Provider Error! rateSchedule',
        e.toString(),
      );
      return null;
    }
    return null;
  }

  Future<WasherModel?> loadWasher(
    BuildContext context,
    int id,
  ) async {
    UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse('${Constants.BACKEND_BASE_URL}/users/washer/geralInfo/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userProvider.token}',
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return WasherModel(
          id: v['id'],
          name: v['name'],
          rate: v['rate'],
        );
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
        'Provider Error! rateSchedule',
        e.toString(),
      );
      return null;
    }
    return null;
  }

  Future<CarObjectModel?> loadObjectCar(
    BuildContext context,
    int id,
  ) async {
    UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse('${Constants.BACKEND_BASE_URL}/schedule/carobject/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userProvider.token}',
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return v['price'];
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
        'Provider Error! loadCarObject',
        e.toString(),
      );
      return null;
    }
    return null;
  }
}

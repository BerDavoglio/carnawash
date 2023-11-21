// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

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
  final List<ScheduleModel> _listSchedules = [];
  // late List<ScheduleModel> _listSchedulesHistory;

  List<ScheduleModel> get listSchedules => _listSchedules;
  // List<ScheduleModel> get listSchedulesHistory => _listSchedulesHistory;

  Future<void> loadSchedules(BuildContext context, DateTime date) async {
    final UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse(
            '${Constants.BACKEND_BASE_URL}/schedule/washer/by-date/${DateFormat('yyyy-MM-dd').format(date)}'),
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
        'Provider Error!',
        e.toString(),
      );
    }
  }

  bool verifyUnaccepted() {
    for (ScheduleModel element in _listSchedules) {
      if (element.status == 'not-accepted') {
        return true;
      }
    }
    return false;
  }

  // Future<void> loadSchedulesHistory(BuildContext context, DateTime initialDate, DateTime finishDate) async {
  //   final UserProvider userProvider = Provider.of(
  //     context,
  //     listen: false,
  //   );
  //   try {
  //     final response = await http.get(
  //       Uri.parse('${Constants.BACKEND_BASE_URL}/schedule/washer/history/${DateFormat('yyyy-MM-dd').format(initialDate)}/${DateFormat('yyyy-MM-dd').format(finishDate)}'),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json',
  //         'Authorization': 'Bearer ${userProvider.token}',
  //       },
  //     );

  //     var v = jsonDecode(response.body);

  //     if (response.statusCode == 200) {
  //       _listSchedulesHistory = v;

  //     } else if (v['errors'] != '') {
  //       await comumDialog(
  //         context,
  //         'Erro!',
  //         v['errors'],
  //       );
  //     }
  //   } catch (e) {
  //     await comumDialog(
  //       context,
  //       'Provider Error!',
  //       e.toString(),
  //     );
  //   }
  // }

  Future<void> changeStatusSchedule(BuildContext context, int id) async {
    final UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse('${Constants.BACKEND_BASE_URL}/schedule/washer/change/$id'),
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
            content: const Text('Status changed with success!'),
            action: SnackBarAction(
              label: 'Okay',
              onPressed: () {},
            ),
          ),
        );
        await loadSchedules(context, DateTime.now());
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

  Future<void> declineSchedule(BuildContext context, int id) async {
    final UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse('${Constants.BACKEND_BASE_URL}/schedule/washer/decline/$id'),
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
            content: const Text('Declined with success!'),
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
        'Provider Error!',
        e.toString(),
      );
    }
  }

  Future<ScheduleModel?> loadScheduleId(BuildContext context, int id) async {
    final UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse('${Constants.BACKEND_BASE_URL}/schedule/washer/by-id/$id'),
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
      }
    } catch (e) {
      await comumDialog(
        context,
        'Provider Error!',
        e.toString(),
      );
    }
    return null;
  }

  Future<ScheduleModel?> loadOngoing(BuildContext context) async {
    final UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        // CRIAR ONGOING PARA WASHER
        Uri.parse('${Constants.BACKEND_BASE_URL}/schedule/washer/ongoing/'),
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
      }
    } catch (e) {
      await comumDialog(
        context,
        'Provider Error!',
        e.toString(),
      );
    }
    return null;
  }

  Future<ClientModel?> loadClient(
    BuildContext context,
    int id,
  ) async {
    UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse('${Constants.BACKEND_BASE_URL}/users/client/geralInfo/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userProvider.token}',
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return ClientModel(id: v['id'], name: v['name']);
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
        'Provider Error! loadClientSchedule',
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
        return CarObjectModel(
          id: v['id'],
          car_id: v['car_id'],
          wash_type: v['wash_type'],
          additional_list_id: v['additional_list_id'],
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
        'Provider Error! loadCarObject',
        e.toString(),
      );
      return null;
    }
    return null;
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

  Future<int> countAll(BuildContext context) async {
    UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse('${Constants.BACKEND_BASE_URL}/schedule/washer/number-all'),
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
        return 0;
      }
    } catch (e) {
      await comumDialog(
        context,
        'Provider Error! countAll',
        e.toString(),
      );
      return 0;
    }
    return 0;
  }

  Future<int> countNext(BuildContext context) async {
    UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse('${Constants.BACKEND_BASE_URL}/schedule/washer/number-next'),
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
        return 0;
      }
    } catch (e) {
      await comumDialog(
        context,
        'Provider Error! countNext',
        e.toString(),
      );
      return 0;
    }
    return 0;
  }

  Future<int> countCancel(BuildContext context) async {
    UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse(
            '${Constants.BACKEND_BASE_URL}/schedule/washer/number-cancel'),
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
        return 0;
      }
    } catch (e) {
      await comumDialog(
        context,
        'Provider Error! countCancel',
        e.toString(),
      );
      return 0;
    }
    return 0;
  }
}

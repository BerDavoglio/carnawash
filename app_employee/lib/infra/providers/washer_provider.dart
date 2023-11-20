// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/data.dart';
import '../../ui/ui.dart';
import '../infra.dart';

class WasherProvider with ChangeNotifier {
  late BankInfoModel _bankInfo;
  late TimeAvailableModel _timeAvailable;
  late WasherInfoModel _washerInfo;
  late List<QuizQuestionModel> _listQuizQuestions;

  BankInfoModel get bankInfo => _bankInfo;
  TimeAvailableModel get timeAvailable => _timeAvailable;
  WasherInfoModel get washerInfo => _washerInfo;
  List<QuizQuestionModel> get listQuizQuestions => _listQuizQuestions;

  Future<void> fistLogin(
    BuildContext context,
    FirstLoginModel firstLoginModel,
  ) async {
    final UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.post(
          Uri.parse('${Constants.BACKEND_BASE_URL}/users/washer/'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${userProvider.token}',
          },
          body: {
            "bank_info": {
              "bank_name": firstLoginModel.bank_info.bank_name,
              "account_name": firstLoginModel.bank_info.account_name,
              "account_number": firstLoginModel.bank_info.account_number,
            },
            "washer_info": {
              "abn": firstLoginModel.washer_info.abn,
              "contract": firstLoginModel.washer_info.contract,
              "driver_licence": firstLoginModel.washer_info.driver_licence,
              "picture": firstLoginModel.washer_info.picture,
            },
          });

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('First Login with success!'),
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

  Future<int> verifyFistLogin(BuildContext context) async {
    final UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse('${Constants.BACKEND_BASE_URL}/users/washer/verify/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userProvider.token}',
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return v['message'];
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
        'Provider Error!',
        e.toString(),
      );
      return 0;
    }
    return 0;
  }

  Future<void> loadQuiz(BuildContext context) async {
    final UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse('${Constants.BACKEND_BASE_URL}/quiz/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userProvider.token}',
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _listQuizQuestions = v;

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

  Future<void> answerQuiz(
    BuildContext context,
    QuizAnswerModel quizAnswer,
  ) async {
    final UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.post(
          Uri.parse('${Constants.BACKEND_BASE_URL}/quiz/respon/'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${userProvider.token}',
          },
          body: {
            "response_list": quizAnswer.responses_list,
          });

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('QuizAnswers sent with success!'),
            action: SnackBarAction(
              label: 'Okay',
              onPressed: () {},
            ),
          ),
        );
        await quizGrade(context);

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

  Future<double?> quizGrade(
    BuildContext context,
  ) async {
    final UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
          Uri.parse('${Constants.BACKEND_BASE_URL}/quiz/respon/'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${userProvider.token}',
          },);

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
        'Provider Error!',
        e.toString(),
      );
    }
    return null;
  }

  Future<void> updateContract(BuildContext context, ByteData contract) async {
    final UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.put(
          Uri.parse('${Constants.BACKEND_BASE_URL}/users/washer/info/'),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${userProvider.token}',
          },
          body: {
            "contract": contract,
          });

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Contract uploaded with success!'),
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

  Future<void> loadBankInfo(BuildContext context) async {
    final UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse('${Constants.BACKEND_BASE_URL}/users/washer/bank/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userProvider.token}',
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _bankInfo = v;

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

  Future<void> updateBankInfo(
      BuildContext context, BankInfoModel bankInfo) async {
    final UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.put(
        Uri.parse('${Constants.BACKEND_BASE_URL}/users/washer/bank/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userProvider.token}',
        },
        body: {
          "bank_name": bankInfo.bank_name,
          "account_name": bankInfo.account_name,
          "account_number": bankInfo.account_number,
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Updated BankInfo with success!'),
            action: SnackBarAction(
              label: 'Okay',
              onPressed: () {},
            ),
          ),
        );
        await loadBankInfo(context);

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

  Future<void> loadTimeAvailable(BuildContext context) async {
    final UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse('${Constants.BACKEND_BASE_URL}/users/washer/time/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userProvider.token}',
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _timeAvailable = v;

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

  Future<void> updateTimeAvailable(
      BuildContext context, TimeAvailableModel timeAvailable) async {
    final UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.put(
        Uri.parse('${Constants.BACKEND_BASE_URL}/users/washer/time/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userProvider.token}',
        },
        body: {
          "sunday_list": timeAvailable.sunday_list,
          "monday_list": timeAvailable.monday_list,
          "tuesday_list": timeAvailable.tuesday_list,
          "wednesday_list": timeAvailable.wednesday_list,
          "thursday_list": timeAvailable.thursday_list,
          "friday_list": timeAvailable.friday_list,
          "saturday_list": timeAvailable.saturday_list,
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Updated TimeAvailable with success!'),
            action: SnackBarAction(
              label: 'Okay',
              onPressed: () {},
            ),
          ),
        );
        await loadTimeAvailable(context);

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

  Future<void> loadWasherInfo(BuildContext context) async {
    final UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse('${Constants.BACKEND_BASE_URL}/users/washer/info/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userProvider.token}',
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _washerInfo = v;

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

  Future<void> updateWasherInfo(
      BuildContext context, WasherInfoModel washerInfo) async {
    final UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.put(
        Uri.parse('${Constants.BACKEND_BASE_URL}/users/washer/info/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userProvider.token}',
        },
        body: {
          "abn": washerInfo.abn,
          "contract": washerInfo.contract,
          "driver_licence": washerInfo.driver_licence,
          "picture": washerInfo.picture,
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Updated WasherInfo with success!'),
            action: SnackBarAction(
              label: 'Okay',
              onPressed: () {},
            ),
          ),
        );
        await loadWasherInfo(context);

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
}

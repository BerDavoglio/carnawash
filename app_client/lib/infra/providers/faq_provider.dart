// ignore_for_file: use_build_context_synchronously, prefer_final_fields

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/data.dart';
import '../../ui/ui.dart';
import '../infra.dart';

class FAQProvider with ChangeNotifier {
  List<FAQModel> _faq = [];
  late ConditionModel _condition;

  List<FAQModel> get faq => _faq;
  ConditionModel get condition => _condition;

  Future<void> loadFAQ(BuildContext context) async {
    final UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse('${Constants.BACKEND_BASE_URL}/faq-terms/faq/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userProvider.token}',
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        for (Map i in v) {
          _faq.add(FAQModel(
            id: i['id'],
            question: i['question'],
            answer: i['answer'],
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
        'Provider Error! loadFAQ',
        e.toString(),
      );
    }
  }

  Future<void> loadTerms(BuildContext context) async {
    final UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse('${Constants.BACKEND_BASE_URL}/faq-terms/condition/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userProvider.token}',
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _condition = ConditionModel(
          id: v['id'],
          tems_conditions: v['tems_conditions'],
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
        'Provider Error! loadTerms',
        e.toString(),
      );
    }
  }
}

// ignore_for_file: non_constant_identifier_names

import '../data.dart';

class FirstLoginModel {
  FirstLoginModel({
    required this.washer_info,
    required this.bank_info,
  });

  WasherInfoModel washer_info;
  BankInfoModel bank_info;
}
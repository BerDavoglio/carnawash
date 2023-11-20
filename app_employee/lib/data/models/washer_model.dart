// ignore_for_file: non_constant_identifier_names

import 'dart:typed_data';

class BankInfoModel {
  BankInfoModel({
    required this.bank_name,
    required this.account_name,
    required this.account_number,
  });

  String bank_name;
  String account_name;
  String account_number;
}

class TimeAvailableModel {
  TimeAvailableModel({
    required this.sunday_list,
    required this.monday_list,
    required this.tuesday_list,
    required this.wednesday_list,
    required this.thursday_list,
    required this.friday_list,
    required this.saturday_list,
  });

  String sunday_list;
  String monday_list;
  String tuesday_list;
  String wednesday_list;
  String thursday_list;
  String friday_list;
  String saturday_list;
}

class WasherInfoModel {
  WasherInfoModel({
    this.made_quiz,
    this.contract_accept,
    this.enable,
    this.rate,
    required this.abn,
    required this.contract,
    required this.driver_licence,
    required this.picture,
  });

  bool? made_quiz;
  bool? contract_accept;
  bool? enable;
  double? rate;
  String abn;
  ByteData contract;
  ByteData driver_licence;
  ByteData picture;
}

// ignore_for_file: non_constant_identifier_names

class PaymentModel {
  PaymentModel({
    this.id,
    required this.washer_id,
    required this.wash_id,
    required this.wash_date,
    this.pay_data,
  });

  int? id;
  int washer_id;
  int wash_id;
  DateTime wash_date;
  DateTime? pay_data;
}

class CarModel {
  CarModel({
    this.id,
    required this.brand,
    required this.model,
    required this.plate,
    required this.color,
    required this.car_size_id,
  });

  int? id;
  String brand;
  String model;
  String plate;
  String color;
  int car_size_id;
}

class CarsizeModel {
  CarsizeModel({
    this.id,
    required this.title,
    required this.price,
    required this.additional_information,
  });

  int? id;
  String title;
  String price;
  String additional_information;
}
// ignore_for_file: non_constant_identifier_names

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

class CarSizeModel {
  CarSizeModel({
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

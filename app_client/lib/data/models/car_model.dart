// ignore_for_file: non_constant_identifier_names

class CarModel {
  CarModel({
    this.id,
    required this.brand,
    required this.model,
    required this.size,
    required this.plate,
    required this.car_size_id,
  });

  int? id;
  String brand;
  String model;
  String size;
  String plate;
  int car_size_id;
}

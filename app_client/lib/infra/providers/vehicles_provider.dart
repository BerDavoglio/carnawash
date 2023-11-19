// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:string_extensions/string_extensions.dart';

import '../../data/data.dart';
import '../../ui/ui.dart';
import '../infra.dart';

class VehiclesProvider with ChangeNotifier {
  List<CarModel> _carsList = [];
  List<BrandModel> _brandList = [];
  List<ModelModel> _modelList = [];

  List<CarModel> get carsList => _carsList;
  List<BrandModel> get brandList => _brandList;
  List<ModelModel> get modelList => _modelList;

  Future<void> loadCars(BuildContext context) async {
    final UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.get(
        Uri.parse('${Constants.BACKEND_BASE_URL}/cars/'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${userProvider.token}',
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _carsList = v;
      } else if (v['errors'] != '') {
        await comumDialog(
          context,
          'Error',
          v['errors'],
        );
      }

      notifyListeners();
    } catch (e) {
      await comumDialog(
        context,
        'Provider Error! SubmitCreate',
        e.toString(),
      );
    }
  }

  Future<CarModel?> loadOneCar(
    BuildContext context,
    int id,
  ) async {
    for (CarModel element in _carsList) {
      if (element.id == id) {
        return element;
      }
    }

    return null;
  }

  Future<void> createCar(
    BuildContext context,
    CarModel car,
  ) async {
    final UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.post(
        Uri.parse('${Constants.BACKEND_BASE_URL}/cars/'),
        body: {
          'brand': car.brand,
          'model': car.model,
          'plate': car.plate,
          'color': car.color,
          'car_size_id': car.car_size_id,
        },
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
            content: const Text('Car created with success!'),
            action: SnackBarAction(
              label: 'Okay',
              onPressed: () {},
            ),
          ),
        );

        await loadCars(context);

        Navigator.of(context).pop();
      } else if (v['errors'] != '') {
        await comumDialog(
          context,
          'Error',
          v['errors'],
        );
      }

      notifyListeners();
    } catch (e) {
      await comumDialog(
        context,
        'Provider Error! SubmitCreate',
        e.toString(),
      );
    }
  }

  Future<void> updateCar(
    BuildContext context,
    CarModel car,
  ) async {
    final UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.put(
        Uri.parse('${Constants.BACKEND_BASE_URL}/cars/${car.id}'),
        body: {
          'brand': car.brand,
          'model': car.model,
          'color': car.color,
          'plate': car.plate,
          'car_size_id': car.car_size_id,
        },
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
            content: const Text('Car updated with success!'),
            action: SnackBarAction(
              label: 'Okay',
              onPressed: () {},
            ),
          ),
        );

        await loadCars(context);

        Navigator.of(context).pop();
      } else if (v['errors'] != '') {
        await comumDialog(
          context,
          'Error',
          v['errors'],
        );
      }

      notifyListeners();
    } catch (e) {
      await comumDialog(
        context,
        'Provider Error! UpdateCar',
        e.toString(),
      );
    }
  }

  Future<void> deleteCar(
    BuildContext context,
    int id,
  ) async {
    final UserProvider userProvider = Provider.of(
      context,
      listen: false,
    );
    try {
      final response = await http.delete(
        Uri.parse('${Constants.BACKEND_BASE_URL}/cars/$id'),
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
            content: const Text('Car deleted with success!'),
            action: SnackBarAction(
              label: 'Okay',
              onPressed: () {},
            ),
          ),
        );

        await loadCars(context);

        Navigator.of(context).pop();
      } else if (v['errors'] != '') {
        await comumDialog(
          context,
          'Error',
          v['errors'],
        );
      }

      notifyListeners();
    } catch (e) {
      await comumDialog(
        context,
        'Provider Error! Delete Car',
        e.toString(),
      );
    }
  }

  Future<void> loadBrands(BuildContext context) async {
    try {
      final response = await http.put(
        Uri.parse(
            'https://private-anon-b9062fef92-carsapi1.apiary-mock.com/manufacturers'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _brandList = v;
      } else if (v['errors'] != '') {
        await comumDialog(
          context,
          'Error',
          v['errors'],
        );
      }

      notifyListeners();
    } catch (e) {
      await comumDialog(
        context,
        'Provider Error! UpdateCar',
        e.toString(),
      );
    }
  }

  Future<void> loadModels(BuildContext context, String brand) async {
    try {
      final response = await http.put(
        Uri.parse(
            'https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets/all-vehicles-model/records?select=model&limit=100&refine=make%3A"${brand.capitalize}"'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );

      var v = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _modelList = v;
      } else if (v['errors'] != '') {
        await comumDialog(
          context,
          'Error',
          v['errors'],
        );
      }

      notifyListeners();
    } catch (e) {
      await comumDialog(
        context,
        'Provider Error! UpdateCar',
        e.toString(),
      );
    }
  }
}

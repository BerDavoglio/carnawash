// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../data/data.dart';
import '../../infra/infra.dart';
import '../ui.dart';

class WashRequestPage extends StatefulWidget {
  ScheduleModel? preData;

  WashRequestPage({
    super.key,
    this.preData,
  });

  @override
  State<WashRequestPage> createState() => _WashRequestPageState();
}

class _WashRequestPageState extends State<WashRequestPage> {
  ClientModel? client;
  List<CarObjectModel> carsObjectList = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      ScheduleProvider scheduleProvider = Provider.of(context, listen: false);
      ServicesProvider servicesProvider = Provider.of(context, listen: false);

      await servicesProvider.loadAdditional(context);

      client = await scheduleProvider.loadClient(context, widget.preData!.id!);

      for (var i in widget.preData!.cars_list_id.split(';')) {
        CarObjectModel? car = await scheduleProvider.loadObjectCar(
          context,
          json.decode(i).car_id as int,
        );
        if (car != null) {
          carsObjectList.add(car);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100]!,
      bottomNavigationBar: navigationBarComponent(context),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 50,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          backButtonComponent(context),
                          const Text(
                            'Wash Information',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      notificationGeralButtonComponent(context),
                    ],
                  ),
                  const SizedBox(height: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('yMMMMd h:mm a')
                            .format(widget.preData!.selected_date)
                            .toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Customer: ${client!.name}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Column(
                        children: List.generate(
                          carsObjectList.length,
                          (index) async {
                            return await requestBox(context, index);
                          } as Widget Function(int index),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Container(
                        padding: const EdgeInsets.all(16),
                        height: 93,
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(229, 229, 229, 1),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Total:',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              '\$ 180.00',
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 48),
                      TextButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(5),
                          fixedSize: MaterialStateProperty.all<Size>(
                            Size(
                              MediaQuery.of(context).size.width * 0.85,
                              50,
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromRGBO(237, 189, 58, 1),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Accept',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Reject',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<Widget> requestBox(
    BuildContext context,
    int id,
  ) async {
    VehiclesProvider vehiclesProvider = Provider.of(context, listen: false);
    ServicesProvider servicesProvider = Provider.of(context, listen: false);

    List<CarModel> carsList = [];
    List<AdditionalModel> addonList = [];
    for (var i in carsObjectList) {
      CarModel? car = await vehiclesProvider.loadOneCar(
        context,
        i.car_id,
      );
      if (car != null) {
        carsList.add(car);
      }
      for (var j in i.additional_list_id.split(';')) {
        AdditionalModel? addon =
            servicesProvider.getAdditionalComplete(int.parse(j));
        addonList.add(addon!);
      }
    }

    return Column(
      children: [
        const SizedBox(height: 16),
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Text(
                        'Vehicle $id',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                      ),
                      width: MediaQuery.of(context).size.width * 0.55,
                      height: 1,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  '${carsList[id].brand} - ${carsList[id].model} - ${servicesProvider.getCarsizeComplete(carsList[0].car_size_id).title}',
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  carsList[id].plate,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  'Wash outside only',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                Row(
                  children: List.generate(
                    addonList.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          '${addonList[index]}; ',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.place_outlined,
                      color: Color.fromRGBO(237, 189, 58, 1),
                    ),
                    Text(
                      widget.preData!.address,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Text(
                  'Your earnings',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  // VALUE AFTER MARKUP
                  '\$ 60.00',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Costumer's comments",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Text(widget.preData!.observation_address),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
